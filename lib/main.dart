import 'package:flutter/material.dart';
import 'package:starbuzz_app/screens/campaign.dart';
import 'package:starbuzz_app/screens/login_page.dart';
import 'package:starbuzz_app/screens/market_place.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const LoginPage());
  }
}
