import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:starbuzz_app/screens/campaign.dart';
import 'package:starbuzz_app/screens/market_place.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 2;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final screens = const [
    CampaignPage(),
    CampaignPage(),
    MarketPlace(),
    MarketPlace(),
    MarketPlace(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: index,
        height: 60.0,
        items: const <Widget>[
          Icon(Icons.home_outlined, size: 30),
          Icon(Icons.search, size: 30),
          Icon(Icons.add, size: 30),
          Icon(Icons.person, size: 30),
          Icon(Icons.chat, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.grey.shade200,
        backgroundColor: Theme.of(context).primaryColor,
        animationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        letIndexChange: (index) => true,
      ),
    );
    // body: Container(
    //   color: Colors.blueAccent,
    //   child: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(_page.toString(), textScaleFactor: 10.0),
    //         ElevatedButton(
    //           child: Text('Go To Page of index 1'),
    //           onPressed: () {
    //             final CurvedNavigationBarState? navBarState = _bottomNavigationKey.currentState;
    //             navBarState?.setPage(1);
    //           },
    //         )
    //       ],
    //     ),
    //   ),
    // ),
  }
}
