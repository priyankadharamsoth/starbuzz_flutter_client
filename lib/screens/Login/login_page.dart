import 'package:flutter/material.dart';
import 'package:starbuzz_app/screens/nav_bar.dart';
import 'package:starbuzz_app/utils/auth_button.dart';
import 'package:starbuzz_app/utils/custom_textfield.dart';
import 'package:starbuzz_app/utils/database.dart';
import 'package:starbuzz_app/screens/Login/home_top_splash.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  bool _passwordVisible = true;

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: SizedBox(
                    child: AuthButton(
                      buttonText: "Influencer",
                      onPressed: () {},
                      leftPadding: 20,
                      rightPadding: 20,
                      backgroundColor: Colors.grey.shade200,
                      categoryIcon: Icons.account_circle_rounded,
                      widthBetweenIconAndText: 10,
                      changeTextColor: Colors.black,
                    ),
                  ),
                )),
                Expanded(
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
                obsecureText: false,
                labelText: "Enter Phone number",
                controller: phoneController,
                keyBoard: TextInputType.number,
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
                obsecureText: _passwordVisible,
                labelText: "Enter password",
                trailingIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
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
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height) * 0.003,
              child: AuthButton(
                changeTextColor: Colors.white,
                buttonText: "Login",
                onPressed: () async {
                  if (await StarBuzzService.login(phoneController.text, passwordController.text) == true) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const BottomNavBar(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "User doesn't exist",
                        ),
                      ),
                    );
                  }
                },
                leftPadding: MediaQuery.of(context).size.height * 0.03,
                rightPadding: MediaQuery.of(context).size.height * 0.03,
                widthBetweenIconAndText: 0,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
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
