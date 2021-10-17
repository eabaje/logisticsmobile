import 'package:flutter/material.dart';

class ProgressBar extends StatefulWidget {
  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          buildProgressContainer("1", Colors.white, Colors.black),
          buildProgressDivider(),
          buildProgressContainer("2", Colors.grey, Colors.white),
          buildProgressDivider(),
          buildProgressContainer("3", Colors.grey, Colors.white),
          buildProgressDivider(),
          buildProgressContainer("4", Colors.grey, Colors.white),
          buildProgressDivider(),
          buildProgressContainer("5", Colors.grey, Colors.white),
          buildProgressDivider(),
          buildProgressContainer("6", Colors.grey, Colors.white),
        ],
      ),
    );
  }

  SizedBox buildProgressDivider() => SizedBox(
        width: 30,
        child: Divider(
          color: Colors.grey,
        ),
      );

  Container buildProgressContainer(
          String label, Color textColor, Color bgColor) =>
      Container(
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle, border: Border.all(color: textColor)),
        child: CircleAvatar(
          backgroundColor: bgColor,
          radius: 13.0,
          child: Text(
            label,
            style: TextStyle(color: textColor),
          ),
        ),
      );
}
