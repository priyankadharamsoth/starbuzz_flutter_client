import 'package:flutter/material.dart';
import 'package:starbuzz_app/utils/database.dart';
import 'package:starbuzz_app/screens/Campaign/grid_view.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({Key? key}) : super(key: key);

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.white,
        bottomOpacity: 0,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.1,
        leading: const Icon(Icons.menu_outlined),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade200,
              child: const Icon(
                Icons.notifications_outlined,
                color: Colors.black,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
          )
        ],
      ),
      body: const CustomGridView(),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            StarBuzzService.categories();
          },
          child: const Icon(
            Icons.headset_mic_outlined,
            color: Colors.white,
          )),
    );
  }
}
