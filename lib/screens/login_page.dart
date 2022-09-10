import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:starbuzz_app/utils/auth_button.dart';
import 'package:starbuzz_app/utils/custom_textfield.dart';
import 'package:starbuzz_app/utils/home_top_splash.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  void login(String phone, String password) async {
    try {
      Response response = await post(
        Uri.parse("https://influence-marketing.herokuapp.com/api/login?phone=$phone&password=$password"),
      );
      print(phone);
      print(password);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);
        print('logged in succesfully');
      } else {
        print("failed");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTopSplash(),
            const Center(
              child: Text(
                "Welcome to Starbuzz",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  "Let's login for explore continues",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: AuthButton(
                    buttonText: "Influencer",
                    onPressed: () {},
                    leftPadding: 20,
                    rightPadding: 20,
                    backgroundColor: Colors.grey.shade200,
                    categoryIcon: Icons.person_pin,
                    widthBetweenIconAndText: 10,
                    changeTextColor: Colors.black,
                  ),
                )),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                    child: AuthButton(
                      buttonText: "Brand",
                      onPressed: () {},
                      leftPadding: 20,
                      rightPadding: 20,
                      categoryIcon: Icons.branding_watermark,
                      widthBetweenIconAndText: 10,
                      changeTextColor: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 5),
              child: Text(
                "Phone",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: CustomTextField(
                labelText: "Enter Phone number",
                controller: phoneController,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, top: 5),
              child: Text(
                "Password",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
              child: CustomTextField(
                labelText: "Enter password",
                trailingIcon: const Icon(Icons.visibility_off),
                controller: passwordController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  const Text("Keep me Signed in"),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.height * 0.1),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height) * 0.002,
              child: AuthButton(
                buttonText: "Login",
                onPressed: () {
                  login(phoneController.text, passwordController.text);
                },
                leftPadding: MediaQuery.of(context).size.height * 0.03,
                rightPadding: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.09),
            LimitedBox(
              maxHeight: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Do not have an account?'),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Sign Up here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
