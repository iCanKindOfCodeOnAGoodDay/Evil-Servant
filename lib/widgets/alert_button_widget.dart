import 'package:evl_srvnt1/constants.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AlertButton extends StatelessWidget {
  final String popUpTitle;
  final String description;
  final String buttonTitle;

  AlertButton(
      {required this.popUpTitle,
      required this.description,
      required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hello from gesture detector');
        Alert(
            context: context,
            title: popUpTitle.toUpperCase(),
            content: Column(
              children: <Widget>[
                Container(
                  // height: 300.0,
                  color: Colors.black12,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          description,
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              // color: kSexyOffWhite,
                              fontFamily: ('Ovo'),
                              fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                // Text(
                //   'or login with',
                //   style: TextStyle(
                //       fontFamily: ('Ovo'),
                //       fontSize: 15.0,
                //       color: Colors.white),
                // ),
                // SizedBox(
                //   height: 10.0,
                // ),
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () => Navigator.pop(context),
                color: Colors.deepPurpleAccent,
                child: Text(
                  "okay".toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ]).show();
      },
      child: Text(
        buttonTitle,
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontFamily: ('BebasNeue'),
          // fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
