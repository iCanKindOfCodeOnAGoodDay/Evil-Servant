import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/screens/browse_landing.dart';
import 'package:evl_srvnt1/widgets/bottom_bar.dart';
import 'package:evl_srvnt1/widgets/evil_top_bar.dart';
import 'package:evl_srvnt1/widgets/gradient_text.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'mobster_profile_screen.dart';

class ProtoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            color: Colors.black54,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                EvilTopBar(),

                EvilBodyHome(),

                /// this widget was the arrow on the bottom of the screen
                /// right now it is commented out in favor of the custom bottom app bar

                // Padding(
                //   padding: const EdgeInsets.only(top: 80.0),
                //   child: Column(
                //     children: [
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           GestureDetector(
                //             child: Icon(
                //               Icons.supervised_user_circle,
                //               size: 50.0,
                //               color: Colors.orangeAccent,
                //             ),
                //             onTap: () {
                //               print('gesture detector arrow tapped');
                //             },
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
                // SizedBox(
                //   height: 30.0,
                // ),

                ////TODO End The Center Of The Screen List View Here

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(right: 20.0),
                //       child: FloatingActionButton(
                //         backgroundColor: Colors.orange,
                //         onPressed: () {
                //           print('fab pressed');
                //         },
                //         child: Icon(
                //           Icons.add,
                //           size: 55.0,
                //           color: Colors.black,
                //         ),
                //       ),
                //     ),
                //   ],
                // )
                //// this is the custom bottom bar widgets combined from the 2 files into this DynamicBottomBar widget
                DynamicBottomBar(chosenButton: Buttons.home),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EvilBodyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ListTile(
            title: Image(
              image: AssetImage('images/coverArt913.png'),
              height: 300.0,
            ),
          ),
          // ListTile(
          //   title: Padding(
          //     padding: EdgeInsets.only(left: 2.0, right: 2.0),
          //     child: GradientText(
          //         'A place to find and hire local talent with an instant NDA included when paid in-app.',
          //         style: TextStyle(fontFamily: ('Ovo'), fontSize: 20.0),
          //         gradient: LinearGradient(colors: [
          //           Colors.orangeAccent,
          //           Colors.purpleAccent,
          //         ])),
          //   ),
          // ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 2.0, right: 2.0),
              child: Text(
                  // 'Nothing illegal happens here. This is just a platform to pay people the maximium wage of \$50 to \$100 hourly for a short amount of their Evil time. How everybody chooses to act during the Evil Act is up to them. There is no script. Whatever Evil Servants want to do is up to them and them alone as they attempt to find value on the platform in their own niche. There is nothing to see here.',
                  // 'Evil Servants are Independent Performers hustling to cement their value while earning maximum wage on the app: \$150 hour. Thus, all types of Evil Acts can and do occur.',
                  // 'The Evil Servants hustle to cement their value during the evil Act while earning their own set maximum wage on the app. Thus, many types of evil Acts can and do occur.',
                  // 'Hire people from your community as independent contractors for jobs they\'re suited for at pay that makes them smile. Every job AKA Evil Act is NDA protected when paid in-app.',
                  'A place to find and hire local talent with an instant NDA included when paid in-app.',
                  // 'hustling hard for the pay they pick and the review they earn. A win-win, win.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      // color: Colors.white,
                      // color: Color(0xffFFFAFA),
                      color: kSexyOffWhite,
                      fontSize: 20.0,
                      // fontWeight: FontWeight.bold,
                      fontFamily: ('Ovo'))),
            ),
          ),

          ListTile(
            title: Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
              child: RawMaterialButton(
                onPressed: () {
                  // do something on pressed
                  Navigator.pushNamed(context, '/browse');
                },
                fillColor: kInactiveCardColor,
                // Colors.deepPurpleAccent,
                elevation: 10.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    // 'Have An Evil Servant Come To You Now',
                    'Services Delivered',
                    style: TextStyle(
                      fontFamily: ('Cinzel'),
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      // color: Colors.white,
                      // color: Color(0xffFFFAFA),
                      color: kSexyOffWhite,

                      // color: Colors.deepPurple,
                    ),
                  ),
                ),
              ),
            ),
          ),

          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RawMaterialButton(
                    fillColor: Colors.black12,
                    onPressed: () {
                      // do something on pressed
                    },
                    child: GestureDetector(
                      onTap: () {
                        Alert(
                            context: context,
                            title: 'About evil Acts'.toUpperCase(),
                            content: Column(
                              children: <Widget>[
                                Container(
                                  // height: 300.0,
                                  color: Colors.black54,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          ' ',
                                          // 'Each Act begins with a message to a few of the available mobsters. Once you have made contact, you have made a big step in the right direction, the Mobsters will be getting back to you soon. Agree on the Act, then proceed to carrying it out. First, each party accepts an in-app NDA covering both parties, then payment is made to the MOBaP, who then pays your mobster \$150 hour.',
                                          style: TextStyle(
                                              color: Colors.white,
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
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            ]).show();
                      },
                      child: GradientText(
                        'about evil Acts',
                        gradient: LinearGradient(colors: [
                          Colors.deepOrangeAccent,
                          Colors.orangeAccent
                        ]),
                        style: TextStyle(
                            fontFamily: ('Audiowide'),
                            fontWeight: FontWeight.bold),
                      ),

                      // Text(
                      //   'about evil Acts',
                      //   style: TextStyle(
                      //     fontFamily: ('Audiowide'),
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.orangeAccent,
                      //   ),
                      //   // textAlign: TextAlign.end,
                      // ),
                    )),
              ],
            ),
          ),
          // ListTile(
          //   title: Container(
          //     height: 300.0,
          //   ),
          // ),

          // ListTile(
          //   title: Padding(
          //     padding: const EdgeInsets.only(right: 20.0),
          //     child: Text(
          //       'All Parties Protected by the HIVE to the best of the algorithm\'s ability. Be safe, and be kind.',
          //       textAlign: TextAlign.center,
          //       style: TextStyle(
          //         fontFamily: ('Ovo'),
          //         // fontWeight: FontWeight.bold,
          //         color: Colors.white,
          //         fontSize: 14.0,
          //       ),
          //       // textAlign: TextAlign.end,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
