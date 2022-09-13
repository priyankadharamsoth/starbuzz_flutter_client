import 'package:flutter/material.dart';

class Followers extends StatelessWidget {
  double top;
  double right;
  Followers({Key? key, required this.top, required this.right}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.orange,
            border: Border.all(
              style: BorderStyle.none,
            ),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10)),
        height: 40,
        width: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Expanded(
              child: Icon(
                Icons.supervisor_account_outlined,
                size: 20,
              ),
            ),
            Expanded(child: Text("23K")),
          ],
        ),
      ),
    );
  }
}
