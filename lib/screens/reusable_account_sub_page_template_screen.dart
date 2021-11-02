import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class ReusableAccountSubPageTemplateScreen extends StatelessWidget {
  final String appBarTitle;
  final String listTileText;

  ReusableAccountSubPageTemplateScreen(
      {required this.appBarTitle, required this.listTileText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        title: GradientText(
          appBarTitle.toUpperCase(),
          gradient: LinearGradient(
            colors: [Colors.deepOrangeAccent, Colors.orangeAccent],
          ),
        ),
        backgroundColor: kInactiveCardColor,
      ),
      backgroundColor: kActiveCardColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    listTileText,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ('Ovo'),
                      fontWeight: FontWeight.bold,
                    ),
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
