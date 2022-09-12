import 'dart:convert';
import 'package:http/http.dart';
import 'package:starbuzz_app/utils/Influencers.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starbuzz_app/utils/constants.dart';

class StarBuzzService {
  static void login(String phone, String password) async {
    Response response = await post(
      Uri.parse("https://influence-marketing.herokuapp.com/api/login?phone=$phone&password=$password"),
    );
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      var responseJson = json.decode(response.body);
      await prefs.setString(SharedPreferenceKeys.userLoginToken, responseJson['token']);
      var data = jsonDecode(response.body);
      print('logged in succesfully');
    } else {
      print("failed");
    }
  }

  static Future influencers() async {
    var pref = await SharedPreferences.getInstance();
    String? userToken = pref.getString(SharedPreferenceKeys.userLoginToken);
    if (userToken == null) {
      throw Exception("token doesn't exist");
    }
    Response response = await get(Uri.parse("https://influence-marketing.herokuapp.com/api/inf"), headers: {"Authorization": "Bearer $userToken"});
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<Influencer> influencers = [];
      var influencersList = jsonData['influencers'];
      for (var i in influencersList) {
        Influencer influencer = Influencer(i['name'], i['photo'], i['followers']);
        influencers.add(influencer);
      }
      return influencers;
    }
  }
}
