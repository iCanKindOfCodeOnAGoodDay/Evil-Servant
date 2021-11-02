import 'package:evl_srvnt1/screens/browse_landing.dart';
import 'package:evl_srvnt1/screens/posts_landing_screen.dart';
import 'package:flutter/material.dart';
import 'screens/proto_home.dart';
import 'screens/account_screen.dart';
import 'screens/mobster_profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          dialogBackgroundColor: Colors.black,
          fontFamily: ('Audiowide'),
        ),
        // home: ProtoHome(),
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => ProtoHome(),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/browse': (context) => BrowseScreen(),
          // When navigating to the "/third" route, build the ThirdScreen widget.
          '/account': (context) => EvilAccount(),
          // When navigating to the "/fourth" route, build the FourthScreen widget.
          '/posts': (context) => PostsLandingScreen(),

          /// FOR THE DETIALS PAGE, WE WILL NOT USE THE MAP, But Material Page Route Instead
        });
  }
}
