import 'package:evl_srvnt1/widgets/body_account_screen.dart';
import 'package:evl_srvnt1/widgets/bottom_bar.dart';
import 'package:evl_srvnt1/widgets/evil_top_bar.dart';
import 'package:flutter/material.dart';

class EvilAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Container(
            color: Colors.black54,
            child: Column(
              children: [
                EvilTopBar(),
                BodyAccountScreenWidget(),
                DynamicBottomBar(chosenButton: Buttons.account),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
