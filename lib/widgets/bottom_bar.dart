import 'package:flutter/material.dart';
import 'package:evl_srvnt1/widgets/bottom_btn.dart';

// enum buttons { home, account, browse }

enum Buttons { home, account, browse, posts }

class DynamicBottomBar extends StatelessWidget {
  Buttons chosenButton = Buttons.home;

  DynamicBottomBar({required this.chosenButton});

  final Color activeButtonColor = Colors.orangeAccent;

  final Color inactiveButtonColor = Colors.white;

  Color colour = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonChild(
            buttonLabel: 'Account',
            iconData: Icons.people,
            contentColor: Buttons.account == chosenButton
                ? activeButtonColor
                : inactiveButtonColor,
            customOnPressed: () {
              if (Buttons.account != chosenButton) {
                // Navigator.pop(context);
                Navigator.pushNamed(context, ('/account'));
              } else {
                print('nothing to do from account button');
              }
            },
          ),
          ButtonChild(
            buttonLabel: 'Home',
            iconData: Icons.home,
            contentColor: Buttons.home == chosenButton
                ? activeButtonColor
                : inactiveButtonColor,
            customOnPressed: () {
              if (Buttons.home != chosenButton) {
                // Navigator.pop(context);
                Navigator.pushNamed(context, ('/'));
              } else {
                print('do nothing u already home');
              }
            },
          ),
          ButtonChild(
            buttonLabel: 'Posts',
            iconData: Icons.list,
            contentColor: Buttons.posts == chosenButton
                ? activeButtonColor
                : inactiveButtonColor,
            customOnPressed: () {
              if (Buttons.posts != chosenButton) {
                // Navigator.pop(context);
                Navigator.pushNamed(context, ('/posts'));

                ///TODO fix the navigator to push to the right screen
                ///
              } else {
                print('do nothing u already posts');
              }
            },
          ),
          ButtonChild(
            buttonLabel: 'Services',
            iconData: Icons.supervised_user_circle,
            contentColor: Buttons.browse == chosenButton
                ? activeButtonColor
                : inactiveButtonColor,
            customOnPressed: () {
              if (Buttons.browse != chosenButton) {
                /// for this button and account
                /// we pop the page when navigating to prevent massive page stack
                // Navigator.pop(context);
                Navigator.pushNamed(context, ('/browse'));
              } else {
                print('nothing to do here - browse');
              }
            },
          ),
        ],
      ),
    );
  }
}
