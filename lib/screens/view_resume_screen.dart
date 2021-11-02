import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class ViewResumeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kActiveCardColor,
      appBar: AppBar(
        backgroundColor: kInactiveCardColor,
        leading: Container(),
        title: GradientText(
          'Viewing Evil Resume'.toUpperCase(),
          gradient: LinearGradient(
            colors: [Colors.deepOrangeAccent, Colors.orangeAccent],
          ),
        ),
      ),

      // Text(
      //   'View This Evil Resume'.toUpperCase(),
      //   style: TextStyle(color: Colors.white),
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Container(
                    child: Image.asset('images/scottResume.png'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.black,
            height: 100.0,
            child: RawMaterialButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    Text(
                      'back',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
