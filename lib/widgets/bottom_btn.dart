import 'package:flutter/material.dart';

class ButtonChild extends StatelessWidget {
  final String buttonLabel;
  final IconData iconData;
  final Color contentColor;
  final VoidCallback customOnPressed;

  ButtonChild(
      {required this.buttonLabel,
      required this.iconData,
      required this.contentColor,
      required this.customOnPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: customOnPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 20.0,
            color: contentColor,
          ),
          Text(
            buttonLabel,
            style: TextStyle(
              color: contentColor,
              fontWeight: FontWeight.bold,
              fontSize: 13.0,
              fontFamily: ('Audiowide'),
            ),
          ),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
