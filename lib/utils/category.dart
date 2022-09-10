import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  Color changeColor;
  Color changeTextColor;
  String category;
  IconData? categoryIcon;
  double customBorderRadius;
  double widthBetweenIconAndText;
  Function onPressed;

  Category({
    Key? key,
    required this.changeColor,
    required this.category,
    this.categoryIcon,
    required this.customBorderRadius,
    required this.widthBetweenIconAndText,
    required this.changeTextColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.49,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.customBorderRadius),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(widget.changeColor),
          ),
          onPressed: widget.onPressed(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(widget.categoryIcon, color: widget.changeTextColor),
              SizedBox(
                width: widget.widthBetweenIconAndText,
              ),
              Text(
                widget.category,
                style: TextStyle(fontSize: 20, color: widget.changeTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
