import 'package:evl_srvnt1/constants.dart';
import 'package:flutter/material.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback nextScreen;

  NextPageButton({required this.nextScreen});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      // fillColor: kInactiveCardColor,
      onPressed: () {
        // Navigator.pop(context);
        print('next screen called');
        nextScreen();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
            Text(
              'next',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
