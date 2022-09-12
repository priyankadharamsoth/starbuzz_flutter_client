import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final categoryTitle;
  final String? imagePath;
  const CategoryButton({Key? key, required this.categoryTitle, this.imagePath}) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  Color elevatedButtonColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            elevatedButtonColor = Colors.orange;
          });
        },
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: elevatedButtonColor)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              "assets/starbuzz_logo.png",
              width: 20,
              height: 20,
            ),
            Text(widget.categoryTitle),
          ],
        ),
      ),
    );
  }
}
