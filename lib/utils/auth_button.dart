import 'package:flutter/material.dart';

class AuthButton extends StatefulWidget {
  final String buttonText;
  final Function onPressed;
  final double leftPadding;
  final double rightPadding;
  final Color? backgroundColor;
  final Color? changeTextColor;
  final IconData? categoryIcon;
  final double? widthBetweenIconAndText;

  const AuthButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.leftPadding,
    required this.rightPadding,
    this.backgroundColor,
    this.changeTextColor,
    this.categoryIcon,
    this.widthBetweenIconAndText,
  }) : super(key: key);

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(widget.leftPadding, 0, widget.rightPadding, 0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(widget.backgroundColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.categoryIcon, color: widget.changeTextColor),
                SizedBox(
                  width: widget.widthBetweenIconAndText,
                ),
                Text(
                  widget.buttonText,
                  style: TextStyle(fontSize: 20, color: widget.changeTextColor),
                ),
              ],
            ),
            onPressed: () {
              widget.onPressed();
            },
          ),
        ));
  }
}
