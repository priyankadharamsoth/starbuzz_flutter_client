import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starbuzz_app/models/influencers.dart';
import 'package:starbuzz_app/utils/constants.dart';

class StarBuzzService {
  static Future<bool> login(String phone, String password) async {
    Response response = await post(
      Uri.parse("https://influence-marketing.herokuapp.com/api/login?phone=$phone&password=$password"),
      // Uncomment below line for testing
      //Uri.parse("https://influence-marketing.herokuapp.com/api/login?phone=8463932332&password=zxcvbnma"),
    );
    if (response.statusCode == 200) {
      final prefs = await SharedPreferences.getInstance();
      var responseJson = json.decode(response.body);
      await prefs.setString(SharedPreferenceKeys.userLoginToken, responseJson['token']);
      var data = jsonDecode(response.body);
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Influencer>> influencers() async {
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
        List<dynamic> categories = i['category'].map((element) => element['name']).toList();
        Influencer influencer = Influencer(
          i['name'],
          i['photo'],
          i['followers'],
          categories,
        );
        influencers.add(influencer);
      }
      return influencers;
    }
    return [];
  }

  static Future<List<String>> categories() async {
    var pref = await SharedPreferences.getInstance();
    String? userToken = pref.getString(SharedPreferenceKeys.userLoginToken);
    if (userToken == null) {
      throw Exception("token doesn't exist");
    }
    Response response =
        await get(Uri.parse("https://influence-marketing.herokuapp.com/api/inf_category"), headers: {"Authorization": "Bearer $userToken"});
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<String> categories = [];
      var categoryList = jsonData['categories'];
      for (var i in categoryList) {
        String category = i['name'];
        categories.add(category);
      }
      return categories;
    }
    return [];
  }
}
