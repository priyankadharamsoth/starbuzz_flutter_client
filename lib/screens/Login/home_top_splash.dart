import "package:flutter/material.dart";

class HomeTopSplash extends StatelessWidget {
  final String? imagePath;
  const HomeTopSplash({Key? key, this.imagePath}) : super(key: key);
  static const Radius borderRadius = Radius.circular(200);
  static const double containerHeightPercent = 0.2;
  static const double circleAvatarRadius = 0.08;

  @override
  Widget build(BuildContext context) {
    double containerHeight = MediaQuery.of(context).size.height * containerHeightPercent;
    return Container(
      height: containerHeight,
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                radius: 1,
                center: Alignment(0, -1),
                colors: [
                  Color.fromARGB(255, 235, 199, 153),
                  Colors.white,
                ],
              ),
            ),
            width: MediaQuery.of(context).size.width,
            height: containerHeight,
          ),
          Positioned(
            top: (containerHeight) - 2 * (MediaQuery.of(context).size.height * circleAvatarRadius),
            left: (MediaQuery.of(context).size.width / 2) - (MediaQuery.of(context).size.height * circleAvatarRadius),
            child: const Image(
              height: 100,
              image: AssetImage("assets/starbuzz_logo.png"),
              alignment: Alignment.center,
            ),
          ),
        ],
      ),
    );
  }
}
