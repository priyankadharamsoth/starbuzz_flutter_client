import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:starbuzz_app/screens/src/bar_item.dart';
import 'package:starbuzz_app/screens/src/build_nav_bar.dart';

class WaterDropCustom extends StatefulWidget {
  const WaterDropCustom({Key? key}) : super(key: key);

  @override
  State<WaterDropCustom> createState() => _WaterDropCustomState();
}

class _WaterDropCustomState extends State<WaterDropCustom> {
  final Color navigationBarColor = Colors.white;
  int selectedIndex = 0;
  late PageController pageController;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return WaterDropNavBar(
      backgroundColor: navigationBarColor,
      onItemSelected: (int index) {
        setState(() {
          selectedIndex = index;
        });
        pageController.animateToPage(selectedIndex, duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
      },
      selectedIndex: selectedIndex,
      barItems: <BarItem>[
        BarItem(
          filledIcon: Icons.bookmark_rounded,
          outlinedIcon: Icons.bookmark_border_rounded,
        ),
        BarItem(filledIcon: Icons.favorite_rounded, outlinedIcon: Icons.favorite_border_rounded),
        BarItem(
          filledIcon: Icons.email_rounded,
          outlinedIcon: Icons.email_outlined,
        ),
        BarItem(
          filledIcon: Icons.folder_rounded,
          outlinedIcon: Icons.folder_outlined,
        ),
      ],
    );
  }
}
