import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/screens/edit_boss_profile_screen.dart';
import 'package:evl_srvnt1/screens/edit_mobster_profile_screen.dart';
import 'package:evl_srvnt1/screens/reusable_account_sub_page_template_screen.dart';
import 'package:evl_srvnt1/widgets/bottom_bar.dart';
import 'package:evl_srvnt1/widgets/evil_top_bar.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:evl_srvnt1/screens/reusable_account_sub_page_template_screen.dart';

import 'account_signed_in_screen_boss.dart';

class AccountSignedInScreenMobster extends StatelessWidget {
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
                                  'Linked Servant Account',
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
                                      'Servant',
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
                                                            'Toggle to your Boss account. Dont worry, you can toggle back and forth.',
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
                                                              AccountSignedInScreenBoss()));
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
                                        'Toggle to Boss account?',
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
                    // ListTile(
                    //   title: EvilTopBar(),
                    // ),
                    ListTile(
                      title: BrowseListOption(
                        cardType: 'Master Jedi Knight',
                        totalRatings: '631',
                        ratingScore: 5,
                        isSearchCard: false,
                        isProfileCard: false,
                        isProfileCardChild: Container(),
                        cardTitle: 'Obi-Wan',
                        buttonColor: kSexyOrangeButtonColor,
                        labelTextColor: Colors.white,
                        buttonLabel: ('View your Servant profile'),
                        isIllegalLineThrough: TextDecoration.none,
                        legallnessIcon: Icons.account_circle,
                        legallnessIconColor: Colors.orange,
                        cardDetail: 'Sith Lords Are My Speciality.',
                        isAvailable: true,
                        cardArtCode: 821,
                        onButtonTap: () {
                          print('Score button tapped');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditMobsterProfileScreen(
                                  mobsterMaxWage: 495,
                                  totalRatings: '631',
                                  ratingScore: 5,
                                  imageCode: 821,
                                  skills: 'Sith Lords Are My Speciality.',
                                  name: 'Obi-Wan',
                                  cardType: 'Master Jedi Knight',
                                ),
                              ));
                        },
                      ),
                    ),
                    ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
                        child: Container(
                          // height: 200.0,
                          color: kInactiveCardColor,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Cash In-App',
                                    style: kReusableDetailCardTitle
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
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.attach_money_outlined,
                                      size: 30.0,
                                      color: Colors.orangeAccent,
                                    ),
                                    Text(
                                      '467',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 100.0,
                                        fontWeight: FontWeight.bold,
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
                                      padding: const EdgeInsets.all(00.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(
                                                Icons.monetization_on,
                                                size: 20.0,
                                                color: Colors.white,
                                              ),
                                              Text(
                                                'Instant Daily Deposits Available.',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13.0,
                                                  fontFamily:
                                                      ('FiraSansExtraCondensed'),
                                                  // fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RawMaterialButton(
                                                  fillColor:
                                                      kSexyOrangeButtonColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  onPressed: () {
                                                    // do something on pressed
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                ReusableAccountSubPageTemplateScreen(
                                                                  appBarTitle:
                                                                      'Cash Out',
                                                                  listTileText:
                                                                      'The cash out page will go here',
                                                                )));
                                                  },
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'Cash Out Now',
                                                      // textAlign: TextAlign.left,
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
                                  'Publish Status',
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
                                      Icons.check_circle,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      'Your Servant account is published and live on search.',
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
                                                BorderRadius.circular(10.0)),
                                        onPressed: () {
                                          // do something on pressed
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReusableAccountSubPageTemplateScreen(
                                                        appBarTitle:
                                                            'Published Status',
                                                        listTileText:
                                                            'Your published status page will go here',
                                                      )));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'Pause your Servant listing',
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
                          // height: 200.0,
                          color: kInactiveCardColor,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Work History',
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
                                      'You\'ve worked 28 hours this week.',
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
                                                BorderRadius.circular(10.0)),
                                        onPressed: () {
                                          // do something on pressed
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReusableAccountSubPageTemplateScreen(
                                                        appBarTitle:
                                                            'Hours Worked',
                                                        listTileText:
                                                            'Your hours worked page will go here when it is built',
                                                      )));
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            'View your hours worked',
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
                                  'Evil Inbox',
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
                                      'You\'ve got 3 unread messages.',
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
                                                BorderRadius.circular(10.0)),
                                        onPressed: () {
                                          // do something on pressed
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ReusableAccountSubPageTemplateScreen(
                                                        appBarTitle: 'Messages',
                                                        listTileText:
                                                            'Your messages will go here',
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
                                Text('Settings', style: kReusableDetailCardTitle
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
                                      'Manage your Servant account settings.',
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
                                                BorderRadius.circular(10.0)),
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
