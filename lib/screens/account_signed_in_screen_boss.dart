import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/screens/account_signed_in_screen_mobster.dart';
import 'package:evl_srvnt1/screens/edit_boss_profile_screen.dart';
import 'package:evl_srvnt1/screens/reusable_account_sub_page_template_screen.dart';
import 'package:evl_srvnt1/widgets/bottom_bar.dart';
import 'package:evl_srvnt1/widgets/evil_top_bar.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AccountSignedInScreenBoss extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0),
        child: Container(
          color: Colors.black54,
          child: Column(
            children: [
              // BodyAccountScreenWidget(),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      title: EvilTopBar(),
                    ),
                    ListTile(
                      title: Image(
                          image: AssetImage('images/coverArt913.png'),
                          height: 300.0),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          color: kInactiveCardColor,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Scott\'s Boss Account',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ('Cinzel')),
                                ),
                                // SizedBox(
                                //   height: 10.0,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Icon(
                                    //   Icons.question_answer,
                                    //   size: 20.0,
                                    //   color: Colors.deepPurpleAccent,
                                    // ),
                                    Text(
                                      'Account Type:',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontFamily: ('FiraSansExtraCondensed'),
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.account_circle,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Boss',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontFamily: ('FiraSansExtraCondensed'),
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        // do something on pressed
                                        Alert(
                                            context: context,
                                            title: 'Toggle Accounts',
                                            content: Column(
                                              children: <Widget>[
                                                Container(
                                                  // height: 300.0,
                                                  color: Colors.black12,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Center(
                                                          child: Text(
                                                            'Dont worry, you can toggle back and forth. Your Servant listing won\'t be live until you publish it.',
                                                            // textAlign: TextAlign.center,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    ('Ovo'),
                                                                fontSize: 17.0),
                                                          ),
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
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AccountSignedInScreenMobster()));
                                                },
                                                color: Colors.deepPurpleAccent,
                                                child: Text(
                                                  "go".toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20),
                                                ),
                                              ),
                                            ]).show();
                                      },
                                      child: Text(
                                        'Toggle to Servant account?',
                                        style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontSize: 12.0,
                                          // fontWeight: FontWeight.bold,
                                          fontFamily:
                                              ('FiraSansExtraCondensed'),
                                          // fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // GestureDetector(
                                //   onTap: () {
                                //     // do something on pressed
                                //   },
                                //   child: Text(
                                //     'Settings',
                                //     style: TextStyle(
                                //       color: Colors.orangeAccent,
                                //       fontSize: 12.0,
                                //       // fontWeight: FontWeight.bold,
                                //       fontFamily: ('FiraSansExtraCondensed'),
                                //       // fontWeight: FontWeight.bold,
                                //     ),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: BrowseListOption(
                        cardType: 'Flutter Developer',
                        totalRatings: '631',
                        ratingScore: 5,
                        isSearchCard: false,
                        isProfileCard: false,
                        isProfileCardChild: Container(),
                        cardTitle: 'Scott',
                        buttonColor: kSexyOrangeButtonColor,
                        labelTextColor: Colors.white,
                        buttonLabel: ('View your Boss profile'),
                        isIllegalLineThrough: TextDecoration.none,
                        legallnessIcon: Icons.account_circle,
                        legallnessIconColor: Colors.orange,
                        cardDetail:
                            'Flutter for 18 months. Almost done with app school.',
                        isAvailable: true,
                        cardArtCode: 913,
                        onButtonTap: () {
                          print('Score button tapped');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditBossProfileScreen(
                                  mobsterMaxWage: 37,
                                  totalRatings: '631',
                                  ratingScore: 5,
                                  imageCode: 913,
                                  skills:
                                      'Flutter for 18 months. Almost done with app school.',
                                  name: 'Scott Quashen',
                                  cardType: 'Flutter Developer',
                                ),
                              ));
                        },
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          // height: 200.0,
                          color: kInactiveCardColor,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order History',
                                  style: kReusableDetailCardTitle,
                                  // TextStyle(
                                  //     color: Colors.white,
                                  //     fontSize: 20.0,
                                  //     fontWeight: FontWeight.bold,
                                  //     fontFamily: ('Cinzel')),
                                ),
                                // SizedBox(
                                //   height: 10.0,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.notifications,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'You haven\'t made any orders',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontFamily: ('FiraSansExtraCondensed'),
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Icon(
                                    //   Icons.monetization_on,
                                    //   size: 20.0,
                                    //   color: Colors.white,
                                    // ),
                                    // Text(
                                    //   'Boss',
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 13.0,
                                    //     fontFamily:
                                    //         ('FiraSansExtraCondensed'),
                                    //     // fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   width: 5.0,
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RawMaterialButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        fillColor: kSexyOrangeButtonColor,
                                        onPressed: () {
                                          // do something on pressed
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReusableAccountSubPageTemplateScreen(
                                                        appBarTitle:
                                                            'Order History',
                                                        listTileText:
                                                            'You don\'t have any orders',
                                                      )));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'View your order history',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              // fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  ('FiraSansExtraCondensed'),
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          color: kInactiveCardColor,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Your Inbox',
                                  style: kReusableDetailCardTitle,
                                  // TextStyle(
                                  //     color: Colors.white,
                                  //     fontSize: 20.0,
                                  //     fontWeight: FontWeight.bold,
                                  //     fontFamily: ('Cinzel')),
                                ),
                                // SizedBox(
                                //   height: 10.0,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.message,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Your inbox is empty.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontFamily: ('FiraSansExtraCondensed'),
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RawMaterialButton(
                                        fillColor: kSexyOrangeButtonColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () {
                                          // do something on pressed
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReusableAccountSubPageTemplateScreen(
                                                        appBarTitle: 'Messages',
                                                        listTileText:
                                                            'You don\'t have any messages',
                                                      )));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'View your inbox',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              // fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  ('FiraSansExtraCondensed'),
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          color: kInactiveCardColor,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Settings',
                                  style: kReusableDetailCardTitle,
                                  // TextStyle(
                                  //     color: Colors.white,
                                  //     fontSize: 20.0,
                                  //     fontWeight: FontWeight.bold,
                                  //     fontFamily: ('Cinzel')),
                                ),
                                // SizedBox(
                                //   height: 10.0,
                                // ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Manage your account settings.',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontFamily: ('FiraSansExtraCondensed'),
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // Icon(
                                    //   Icons.monetization_on,
                                    //   size: 20.0,
                                    //   color: Colors.white,
                                    // ),
                                    // Text(
                                    //   'Boss',
                                    //   style: TextStyle(
                                    //     color: Colors.white,
                                    //     fontSize: 13.0,
                                    //     fontFamily:
                                    //         ('FiraSansExtraCondensed'),
                                    //     // fontWeight: FontWeight.bold,
                                    //   ),
                                    // ),
                                    // SizedBox(
                                    //   width: 5.0,
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: RawMaterialButton(
                                        fillColor: kSexyOrangeButtonColor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        onPressed: () {
                                          // do something on pressed
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReusableAccountSubPageTemplateScreen(
                                                        appBarTitle: 'Settings',
                                                        listTileText:
                                                            'Your settings page will go here',
                                                      )));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Update Settings',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12.0,
                                              // fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  ('FiraSansExtraCondensed'),
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DynamicBottomBar(chosenButton: Buttons.account),
            ],
          ),
        ),
      ),
    );
  }
}
