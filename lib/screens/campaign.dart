import 'package:flutter/material.dart';
import 'package:starbuzz_app/screens/nav_bar.dart';
import 'package:starbuzz_app/screens/water_nav_bar.dart';
import 'package:starbuzz_app/utils/grid_view.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({Key? key}) : super(key: key);

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        leading: const Icon(Icons.menu_outlined),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
              backgroundColor: Colors.grey.shade200,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
          )
        ],
      ),
      body: const CustomGridView(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
