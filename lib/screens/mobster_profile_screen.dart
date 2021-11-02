import 'package:evl_srvnt1/screens/see_posts_screen.dart';
import 'package:evl_srvnt1/screens/view_resume_screen.dart';
import 'package:evl_srvnt1/widgets/alert_button_widget.dart';
import 'package:evl_srvnt1/widgets/bottom_bar.dart';
import 'package:evl_srvnt1/widgets/gradient_text.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:evl_srvnt1/widgets/questions_widget.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:evl_srvnt1/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:open_file/open_file.dart';

class MobsterProfileScreen extends StatefulWidget {
  final String cardType;

  final String name;
  final String skills;
  final int imageCode;
  final String totalRatings;
  final int ratingScore;
  final num mobsterMaxWage;

  MobsterProfileScreen(
      {required this.cardType,
      required this.name,
      required this.skills,
      required this.imageCode,
      required this.totalRatings,
      required this.ratingScore,
      required this.mobsterMaxWage});

  @override
  _MobsterProfileScreenState createState() => _MobsterProfileScreenState();
}

class _MobsterProfileScreenState extends State<MobsterProfileScreen> {
  bool showTopBar = true;

  bool showQuestionsWidget = false;

  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(_scrollListener);

    super.initState();
  }

  _scrollListener() {
    if (_controller.offset >= _controller.position.maxScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        showQuestionsWidget = true;
      });
    } else if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      // print('do something');
      setState(() {
        showQuestionsWidget = false;
        showTopBar = true;
      });
    } else if (_controller.hasClients == true) {
      {
        setState(() {
          showTopBar = false;
          showQuestionsWidget = false;
        });
      }
    }
  }

  @override
  void dispose() {
    // Don't forget to dispose the ScrollController.
    _controller.dispose();
    super.dispose();
  }

  Widget manageBuildingBottomWidgets() {
    if (showQuestionsWidget == true) {
      return QuestionsWidget();
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 90.0),
        child: GestureDetector(
          onTap: () {
            ////
            setState(() {
              showQuestionsWidget = true;
            });
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_circle_down,
                size: 60.0,
                color: kInactiveCardColor,
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget manageBuildingTopBarWidgets() {
    if (showTopBar == true) {
      return Container(
        color: kInactiveCardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Evil Profile',
                style: kReusableDetailCardTitle,
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.person,
                            size: 20.0,
                            color: Colors.deepPurpleAccent,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            widget.name,
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
                            Icons.work_sharp,
                            size: 20.0,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            widget.cardType,
                            style: TextStyle(
                              color: Colors.white,
                              // color: kSexyOffWhite,
                              fontSize: 13.0,
                              fontFamily: ('FiraSansExtraCondensed'),
                              // fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.attach_money,
                            size: 15.0,
                            color: Colors.white,
                          ),
                          GradientText(widget.mobsterMaxWage.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 45.0,
                                fontFamily: ('BebasNeue'),
                                // fontWeight: FontWeight.bold,
                                // fontWeight: FontWeight.bold,
                              ),
                              gradient: LinearGradient(colors: [
                                Colors.deepOrangeAccent,
                                Colors.orangeAccent,
                              ])),
                          // Text(
                          //   widget.mobsterMaxWage.toString(),
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 20.0,
                          //     fontFamily: ('Ovo'),
                          //     fontWeight: FontWeight.bold,
                          //     // fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Evil Rate',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 13.0,
                          //     fontFamily: ('FiraSansExtraCondensed'),
                          //     // fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          AlertButton(
                              popUpTitle: 'Evil Rate',
                              description:
                                  'The hourly rate that each Servant charges for evil work on the app. Our collection is \$0.42 per hour for Bosses and Evil Servants. Each transaction is NDA protected when paid in-app.',
                              buttonTitle: 'Evil Rate')
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      showTopBar = true;

                      _controller.jumpTo(0.0);
                    });
                  },
                  child: Icon(
                    Icons.arrow_circle_up,
                    color: kInactiveCardColor,
                    size: 60.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: showTopBar == true ? kInactiveCardColor : Colors.black,
            height: 40.0,
          ),
          manageBuildingTopBarWidgets(),
          Expanded(
            child: ListView(
              controller: _controller,
              children: [
                // ListTile(
                //   title: Padding(
                //     padding: const EdgeInsets.only(bottom: 10.0),
                //     child: Container(
                //       color: Colors.white10,
                //       child: Padding(
                //         padding: const EdgeInsets.all(5.0),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               'Mobster Profile',
                //               style: TextStyle(
                //                   color: Colors.white,
                //                   fontSize: 25.0,
                //                   fontWeight: FontWeight.bold,
                //                   fontFamily: ('Cinzel')),
                //             ),
                //             // SizedBox(
                //             //   height: 10.0,
                //             // ),
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Icon(
                //                           Icons.person,
                //                           size: 20.0,
                //                           color: Colors.deepPurpleAccent,
                //                         ),
                //                         Text(
                //                           name,
                //                           style: TextStyle(
                //                             color: Colors.white,
                //                             fontSize: 14.0,
                //                             fontFamily:
                //                                 ('FiraSansExtraCondensed'),
                //                             // fontWeight: FontWeight.bold,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Icon(
                //                           Icons.work_sharp,
                //                           size: 20.0,
                //                           color: Colors.orangeAccent,
                //                         ),
                //                         Text(
                //                           cardType,
                //                           style: TextStyle(
                //                             color: Colors.white,
                //                             fontSize: 13.0,
                //                             fontFamily:
                //                                 ('FiraSansExtraCondensed'),
                //                             // fontWeight: FontWeight.bold,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 ),
                //                 Column(
                //                   crossAxisAlignment: CrossAxisAlignment.end,
                //                   children: [
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Icon(
                //                           Icons.attach_money,
                //                           size: 14.0,
                //                           color: Colors.deepPurpleAccent,
                //                         ),
                //                         Text(
                //                           mobsterMaxWage.toString(),
                //                           style: TextStyle(
                //                             color: Colors.orangeAccent,
                //                             fontSize: 20.0,
                //                             fontFamily: ('Ovo'),
                //                             fontWeight: FontWeight.bold,
                //                             // fontWeight: FontWeight.bold,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                     Row(
                //                       mainAxisAlignment:
                //                           MainAxisAlignment.start,
                //                       children: [
                //                         Text(
                //                           'Mobster MaxWage',
                //                           style: TextStyle(
                //                             color: Colors.white,
                //                             fontSize: 13.0,
                //                             fontFamily:
                //                                 ('FiraSansExtraCondensed'),
                //                             // fontWeight: FontWeight.bold,
                //                           ),
                //                         ),
                //                       ],
                //                     ),
                //                   ],
                //                 )
                //               ],
                //             ),
                //           ],
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                ListTile(
                  title: BrowseListOption(
                      cardType: widget.cardType,
                      totalRatings: widget.totalRatings,
                      ratingScore: widget.ratingScore,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: widget.name,
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('Message Now'),
                      isIllegalLineThrough: TextDecoration.none,
                      legallnessIcon: Icons.message_outlined,
                      legallnessIconColor: Colors.orange,
                      cardDetail: widget.skills,
                      isAvailable: true,
                      cardArtCode: widget.imageCode,
                      onButtonTap: () {
                        print('Profile button tapped');
                        Alert(
                            context: context,
                            title: 'Hold On A Second'.toUpperCase(),
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
                                          'This application does not have a backend and you cannot hire ${widget.name} through this application. Currently this App is just a front-end portfolio project.',
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

                      /// the final property of the BrowseListOptionWidget
                      ///  , we need a switch to change the type of card
                      isProfileCardChild: Column(
                        children: [
                          /// the below cardType is now coming from the reusableDetail card....
                          /// aka the BrowseListOption Widget itself.
                          // Padding(
                          //   padding: const EdgeInsets.only(bottom: 20.0),
                          //   child: Row(
                          //     children: [
                          //       Text(
                          //         widget.cardType,
                          //         style: TextStyle(
                          //             color: Colors.white,
                          //             fontFamily: ('BebasNeue'),
                          //             fontSize: 15.0),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          ProfileBoxes(),
                        ],
                      )),
                ),

                ///TODO replace the questions widget with a function
                ///that returns the questions widget or the closed icon
                ListTile(
                  title: manageBuildingBottomWidgets(),
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

class ProfileBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Container(
        height: 875.0,
        // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        // color: Colors.black,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: [
                  // Icon(
                  //   FontAwesomeIcons.thumbsUp,
                  //   color: Colors.white,
                  //   size: 20.0,
                  // ),
                  // SizedBox(
                  //   width: 5.0,
                  // ),

                  FollowWidget()
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Icon(
                  //   FontAwesomeIcons.trafficLight,
                  //   color: Colors.white,
                  //   size: 20.0,
                  // ),
                  // SizedBox(
                  //   width: 5.0,
                  // ),
                  GestureDetector(
                    // child: Text(
                    //   'see posts',
                    //   style:
                    //       TextStyle(color: kInactiveCardColor, fontSize: 15.0),
                    // ),
                    child: GradientText(
                      'see posts',
                      style: const TextStyle(fontSize: 15),
                      gradient: LinearGradient(colors: [
                        Colors.deepOrangeAccent, Colors.orangeAccent,
// Colors.deepPurpleAccent, Colors.orangeAccent,
                      ]),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SeePostsScreen()));
                    },
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '734',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.0,
                                  fontFamily: ('Ovo')),
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Icon(
                              FontAwesomeIcons.solidClock,
                              color: Colors.white,
                              size: 20.0,
                            )
                          ],
                        ),
                      ),
                      GradientText(
                        'evil servant hours',
                        style: const TextStyle(
                            fontSize: 15, fontFamily: ('BebasNeue')),
                        gradient: LinearGradient(colors: [
                          // Colors.blue.shade400,
                          // Colors.blue.shade900,
                          // Colors.deepPurple.shade400,
                          // Colors.deepPurple.shade400,
                          Colors.white,
                          Colors.white,
                        ]),
                      ),
                    ],
                  ),
                  // todo put that widget you jacked back here lol
                ],
              ),
            ),
            FiveCustomProfileBoxes(),

            //// this should be a row with a Column, and a Gesture Detector
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            FontAwesomeIcons.solidClock,
                            color: Colors.white,
                            size: 20.0,
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            '24 hours',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 13.0,
                                fontFamily: ('Ovo')),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GradientText(
                            'notice needed',
                            style: const TextStyle(
                                fontSize: 15, fontFamily: ('BebasNeue')),
                            gradient: LinearGradient(colors: [
                              // Colors.blue.shade400,
                              // Colors.blue.shade900,
                              // Colors.deepPurple.shade400,
                              // Colors.deepPurple.shade400,
                              Colors.white,
                              Colors.white,
                            ]),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    child: GradientText(
                      'view resume',
                      style: const TextStyle(fontSize: 15),
                      gradient: LinearGradient(colors: [
                        // Colors.blue.shade400,
                        // Colors.blue.shade900,
                        // Colors.deepPurple.shade400,
                        // Colors.deepPurple.shade400,
                        Colors.deepOrangeAccent,
                        Colors.orangeAccent,
                      ]),
                    ),
                    onTap: () {
                      print('view resume tapped');
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ViewResumeScreen()));
                      // OpenFile.open('/images/coverArt2.png');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 6.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GradientText(
                  'hire now',
                  style: const TextStyle(fontSize: 15),
                  gradient: LinearGradient(colors: [
                    Colors.deepOrangeAccent,
                    Colors.orangeAccent,
                  ]),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 0.0),
                  child: Text(
                    'Servant',
                    style: TextStyle(
                        color: Colors.white, fontFamily: ('BebasNeue')),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FollowWidget extends StatefulWidget {
  @override
  _FollowWidgetState createState() => _FollowWidgetState();
}

class _FollowWidgetState extends State<FollowWidget> {
  bool isFollowing = false;

  Widget buildFollowWidget() {
    if (isFollowing == false) {
      return Row(
        children: [
          GestureDetector(
            child: GradientText(
              'follow',
              style: const TextStyle(fontSize: 15),
              gradient: LinearGradient(colors: [
                // Colors.blue.shade400,
                // Colors.blue.shade900,
                Colors.deepOrangeAccent, Colors.orangeAccent,
              ]),
            ),
            // child: Text(
            //   ///TODO use Gradient text here instead
            //   ///and for the other buttons around the profile boxes widgets
            //
            //   'follow',
            //   style: TextStyle(color: kInactiveCardColor, fontSize: 15.0),
            // ),
            onTap: () {
              setState(() {
                isFollowing = !isFollowing;
              });
            },
          ),
        ],
      );
    } else {
      return Row(
        children: [
          GestureDetector(
            child: GradientText(
              'following',
              style: const TextStyle(fontSize: 15),
              gradient: LinearGradient(colors: [
                // Colors.blue.shade400,
                // Colors.blue.shade900,
                Colors.deepPurpleAccent, Colors.orangeAccent,
              ]),
            ),
            onTap: () {
              setState(() {
                isFollowing = !isFollowing;
              });
            },
          ),
          Icon(
            FontAwesomeIcons.checkCircle,
            color: Colors.orangeAccent,
            size: 12.0,
          ),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return buildFollowWidget();
  }
}

enum Boxes { skill, work, about, role, industry, allInactive }

class FiveCustomProfileBoxes extends StatefulWidget {
  @override
  _FiveCustomProfileBoxesState createState() => _FiveCustomProfileBoxesState();
}

class _FiveCustomProfileBoxesState extends State<FiveCustomProfileBoxes> {
  Boxes activeBox = Boxes.allInactive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, bottom: 8, right: 8),
                    child: ProfileContainer(
                        customOnTap: () {
                          setState(() {
                            if (activeBox != Boxes.skill) {
                              activeBox = Boxes.skill;
                            } else {
                              activeBox = Boxes.allInactive;
                            }
                          });
                        },
                        cardBody: Boxes.skill == activeBox
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    // end: Alignment(0.8,
                                    //     0.0), // 10% of the width, so there are ten blinds.
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      // Color(0xffee0000),
                                      // Color(0xffeeee00),
                                      kActiveCardColor,
                                      kInactiveCardColor,
                                      // Colors.white10,
                                      // Colors.black,
                                    ], // red to yellow
                                    tileMode: TileMode
                                        .repeated, // repeats the gradient over the canvas
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'SELF Declared'.toUpperCase(),
                                        style: kCardLabelStyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Skill Out Of 10: Flutter Development',
                                        textAlign: TextAlign.center,
                                        style: kCardSubHeadingStyle,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Text(
                                    //     'Self Reported',
                                    //     style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontFamily: ('Ovo'),
                                    //         fontSize: 10.0),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: kInactiveCardColor),
                                // color: kInactiveCardColor,
                                // color: Colors.blueAccent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Job Skill Level'.toUpperCase(),
                                      style: kCardLabelStyle,
                                    ),
                                    // Icon(
                                    //   Icons.anchor,
                                    //   color: Colors.deepPurpleAccent,
                                    //   size: 70.0,
                                    // ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      textBaseline: TextBaseline.alphabetic,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.baseline,
                                      children: [
                                        // Text(
                                        //   '8.5',
                                        //   style: kProfileBoxContentOrangeStyle,
                                        // ),
                                        GradientText(
                                          '8.5',
                                          style: const TextStyle(
                                              // fontWeight: FontWeight.bold,
                                              fontSize: 80,
                                              fontFamily: ('BebasNeue')),
                                          gradient: LinearGradient(colors: [
                                            // Colors.blue.shade400,
                                            // Colors.blue.shade900,
                                            Colors.deepOrangeAccent,

                                            Colors.orangeAccent,
                                            // Colors.white,
                                            // Colors.white,

                                            // Colors.deepPurple.shade400,
                                            //
                                            // Colors.deepPurple.shade400,
                                          ]),
                                        ),
                                        Text(
                                          '/10',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10.0,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )),

                    // ProfileContainerOdd(
                    //   chosenBox: Boxes.skill,
                    //   cardTitle: 'Skill Level',
                    //   unClickedWidget: Text(
                    //     '8.5',
                    //     style: TextStyle(
                    //         color: Colors.orangeAccent,
                    //         fontSize: 60.0,
                    //         fontWeight: FontWeight.bold),
                    //   ),
                    //   clickedTitle: 'Self Reported',
                    //   clickedWidget: Column(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.only(left: 8.0),
                    //         child: Text(
                    //           'Skill Assessed: Front End Flutter Development',
                    //           textAlign: TextAlign.center,
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontFamily: ('Ovo'),
                    //               fontSize: 13.0,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, bottom: 8, left: 8),
                    child: ProfileContainer(
                        customOnTap: () {
                          setState(() {
                            if (activeBox != Boxes.role) {
                              activeBox = Boxes.role;
                            } else {
                              activeBox = Boxes.allInactive;
                            }
                          });
                        },
                        cardBody: Boxes.role == activeBox
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    // end: Alignment(0.8,
                                    //     0.0), // 10% of the width, so there are ten blinds.
                                    end: Alignment.bottomLeft,
                                    colors: <Color>[
                                      // Color(0xffee0000),
                                      // Color(0xffeeee00),
                                      kActiveCardColor,
                                      kInactiveCardColor,

                                      // Colors.white10,
                                      // Colors.black,
                                    ], // red to yellow
                                    tileMode: TileMode
                                        .repeated, // repeats the gradient over the canvas
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'SELF Declared'.toUpperCase(),
                                        style: kCardLabelStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: kInactiveCardColor),
                                // color: kInactiveCardColor,
                                // color: Colors.yellow,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Street Smarts'.toUpperCase(),
                                      style: kCardLabelStyle,
                                    ),
                                    // Icon(
                                    //   Icons.icecream,
                                    //   color: Colors.deepPurpleAccent,
                                    //   size: 70.0,
                                    // ),
                                    // Text(
                                    //   'B+',
                                    //   style: kProfileBoxContentPurpleStyle,
                                    // ),
                                    GradientText(
                                      'B+',
                                      style: const TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 80,
                                          fontFamily: ('BebasNeue')),
                                      gradient: LinearGradient(colors: [
                                        // Colors.blue.shade400,
                                        // Colors.blue.shade900,
                                        // Colors.deepPurple.shade400,
                                        // Colors.deepOrangeAccent,

                                        // Colors.orangeAccent,
                                        //
                                        // Colors.deepPurple.shade600,
                                        // Colors.deepPurple.shade600,
                                        Colors.deepOrangeAccent,

                                        Colors.orangeAccent,
                                        // Colors.deepPurpleAccent,
                                        // Colors.purpleAccent,
                                        // Colors.deepPurple.shade300,
                                        // Colors.deepPurple.shade300,
                                      ]),
                                    ),
                                  ],
                                ),
                              )),

                    // ProfileContainerOdd(
                    //   chosenBox: Boxes.work,
                    //   // iconData: Icons.anchor,
                    //   unClickedWidget: Icon(
                    //     Icons.anchor,
                    //     color: Colors.deepPurpleAccent,
                    //     size: 70.0,
                    //   ),
                    //   cardTitle: 'Workstyle',
                    //   clickedTitle: 'quiz result',
                    //   clickedWidget: Container(
                    //     child: Column(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 8.0),
                    //           child: Row(
                    //             children: [
                    //               Text(
                    //                 'Anchor',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontFamily: ('Ovo'),
                    //                     fontSize: 13.0,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text(
                    //             'This person is always on top of the project. They like to get ahead, and put their heads down to work, but they\'re not against building team spirit by having a good time while doing so.',
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontFamily: ('Ovo'),
                    //                 fontSize: 10.0),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                bottom: 8,
              ),
              child: ProfileContainer(
                customOnTap: () {
                  setState(() {
                    if (activeBox != Boxes.about) {
                      activeBox = Boxes.about;
                    } else {
                      activeBox = Boxes.allInactive;
                    }
                  });
                },
                cardBody: Boxes.about == activeBox
                    ? Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            // end: Alignment(0.8,
                            //     0.0), // 10% of the width, so there are ten blinds.
                            end: Alignment.bottomRight,

                            colors: <Color>[
                              // Color(0xffee0000),
                              // Color(0xffeeee00),
                              // Colors.black,
                              kSexyOrangeButtonColor,
                              kInactiveCardColor,

                              // Colors.white10,
                              // Colors.black,
                            ], // red to yellow
                            tileMode: TileMode
                                .repeated, // repeats the gradient over the canvas
                          ),
                        ),

                        // Colors.blueAccent,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisAlignment:
                          // MainAxisAlignment.center,
                          children: [
                            Column(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              // mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10.0,
                                    bottom: 10.0,
                                  ),
                                  child: Text(
                                    'Evil Plans'.toUpperCase(),
                                    style: kCardLabelStyle,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    // top: 30.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    'Here, my friends, is a nice lil place for each servant to talk about their plans for the future. I think that this is the final component that is needed to provide a freaking sweet dashboard for employers to browse candidates.',
                                    style: kCardSmallBodyStyle,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                      ),
                                      child: Text(
                                        'App Developer',
                                        // .toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontFamily: ('Ovo'),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                        top: 3.0,
                                        bottom: 10.0,
                                        // top: 30.0,
                                        // bottom: 10.0,
                                      ),
                                      child: Text(
                                        'Dream Job'.toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: ('Ovo'),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 8.0,
                            // ),
                          ],
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          // color: kInactiveCardColor,
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            // end: Alignment(0.8,
                            //     0.0), // 10% of the width, so there are ten blinds.
                            end: Alignment.topLeft,

                            colors: <Color>[
                              // Color(0xffee0000),
                              // Color(0xffeeee00)
                              // Colors.black54,
                              // Colors.black,

                              // Colors.black,

                              kInactiveCardColor,
                              kSexyOrangeButtonColor,

                              // kActiveCardColor,
                            ], // red to yellow
                            tileMode: TileMode
                                .repeated, // repeats the gradient over the canvas
                          ),
                        ),

                        // color: Colors.white10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisAlignment:
                          // MainAxisAlignment.center,
                          children: [
                            Column(
                              // mainAxisAlignment:
                              //     MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 10.0,
                                    bottom: 10.0,
                                  ),
                                  child: Text(
                                    'About Service'.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: ('Ovo'),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    // top: 30.0,
                                    bottom: 5.0,
                                  ),
                                  child: Text(
                                    'How about each Servant on the app gets a lil spot where they can captivate the bosses and increase their chances of being hired and better explain their needs to employers.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: ('Ovo'),
                                      fontSize: 13.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10.0,
                                        right: 10.0,
                                      ),
                                      child: Text(
                                        'Santa Clarita, Ca',
                                        // .toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.orangeAccent,
                                          fontFamily: ('Ovo'),
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10.0,
                                        top: 3.0,
                                        bottom: 10.0,
                                        // top: 30.0,
                                        // bottom: 10.0,
                                      ),
                                      child: Text(
                                        'Based'.toUpperCase(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: ('Ovo'),
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            // SizedBox(
                            //   height: 8.0,
                            // ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 8.0, bottom: 8, right: 8),
                    child: ProfileContainer(
                        customOnTap: () {
                          setState(() {
                            if (activeBox != Boxes.work) {
                              activeBox = Boxes.work;
                            } else {
                              activeBox = Boxes.allInactive;
                            }
                          });
                        },
                        cardBody: Boxes.work == activeBox
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    // end: Alignment(0.8,
                                    //     0.0), // 10% of the width, so there are ten blinds.
                                    end: Alignment.bottomLeft,
                                    colors: <Color>[
                                      // Color(0xffeeee00),
                                      //
                                      // Color(0xffee0000),
                                      kInactiveCardColor,

                                      kActiveCardColor,
                                      // Colors.white10,
                                      // Colors.black,
                                    ], // red to yellow
                                    tileMode: TileMode
                                        .repeated, // repeats the gradient over the canvas
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'SELF Declared'.toUpperCase(),
                                        style: kCardLabelStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: kInactiveCardColor),
                                // color: kInactiveCardColor,
                                // color: Colors.green,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Book Smarts'.toUpperCase(),
                                      style: kCardLabelStyle,
                                    ),
                                    // Text(
                                    //   'A-',
                                    //   style: kProfileBoxContentPurpleStyle,
                                    // ),
                                    GradientText(
                                      'A-',
                                      style: const TextStyle(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 80,
                                          fontFamily: ('BebasNeue')),
                                      gradient: LinearGradient(colors: [
                                        // Colors.blue.shade400,
                                        // Colors.blue.shade900,
                                        // Colors.deepPurple.shade400,
                                        // Colors.deepOrangeAccent,
                                        // Colors.orangeAccent,
                                        //
                                        // Colors.deepPurple.shade600,
                                        // Colors.deepPurpleAccent,
                                        // Colors.purpleAccent,
                                        Colors.deepOrangeAccent,

                                        Colors.orangeAccent,

                                        // Colors.deepPurple.shade300,
                                        // Colors.deepPurple.shade300,

                                        // Colors.orangeAccent,
                                      ]),
                                    ),
                                  ],
                                ),
                              )),
                    // ProfileContainerOdd(
                    //   chosenBox: Boxes.role,
                    //   cardTitle: 'Team Role',
                    //   // iconData: Icons.icecream,
                    //   unClickedWidget: Icon(
                    //     Icons.icecream,
                    //     color: Colors.deepPurpleAccent,
                    //     size: 70.0,
                    //   ),
                    //   clickedTitle: 'quiz result',
                    //   clickedWidget:
                    //   Container(
                    //     child: Column(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 8.0),
                    //           child: Row(
                    //             children: [
                    //               Text(
                    //                 'Ice Cream',
                    //                 style: TextStyle(
                    //                     color: Colors.white,
                    //                     fontFamily: ('Ovo'),
                    //                     fontSize: 13.0,
                    //                     fontWeight: FontWeight.bold),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //         Padding(
                    //           padding: const EdgeInsets.all(8.0),
                    //           child: Text(
                    //             'This person is always on top of the project. They like to get ahead, and put their heads down to work, but they\'re not against building team spirit by having a good time while doing so.',
                    //             style: TextStyle(
                    //                 color: Colors.white,
                    //                 fontFamily: ('Ovo'),
                    //                 fontSize: 10.0),
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, bottom: 8, left: 8),
                      child: ProfileContainer(
                        customOnTap: () {
                          setState(() {
                            if (activeBox != Boxes.industry) {
                              activeBox = Boxes.industry;
                            } else {
                              activeBox = Boxes.allInactive;
                            }
                          });
                        },
                        cardBody: Boxes.industry == activeBox
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    // end: Alignment(0.8,
                                    //     0.0), // 10% of the width, so there are ten blinds.
                                    end: Alignment.bottomRight,
                                    colors: <Color>[
                                      // Color(0xffeeee00),
                                      //
                                      // Color(0xffee0000),
                                      kInactiveCardColor,
                                      kActiveCardColor,

                                      // Colors.white10,
                                      // Colors.black,
                                    ], // red to yellow
                                    tileMode: TileMode
                                        .repeated, // repeats the gradient over the canvas
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'SELF Declared'.toUpperCase(),
                                        style: kCardLabelStyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        'Months In Industry: Flutter Development',
                                        textAlign: TextAlign.center,
                                        style: kCardSubHeadingStyle,
                                      ),
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: Text(
                                    //     'Self Reported',
                                    //     style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontFamily: ('Ovo'),
                                    //         fontSize: 10.0),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.0),
                                    color: kInactiveCardColor),
                                // color: kInactiveCardColor,
                                // color: Colors.pinkAccent,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      // 'Industry Months'.toUpperCase(),
                                      'Job XP Level'.toUpperCase(),

                                      style: kCardLabelStyle,
                                    ),
                                    // Icon(
                                    //   Icons.anchor,
                                    //   color: Colors.deepPurpleAccent,
                                    //   size: 70.0,
                                    // ),
                                    // Text('96',
                                    //     style: kProfileBoxContentOrangeStyle),
                                    GradientText(
                                      '21',
                                      style: const TextStyle(
                                        // fontWeight: FontWeight.bold,

                                        fontSize: 80,
                                        fontFamily: ('BebasNeue'),
                                        // fontWeight: FontWeight.bold
                                      ),
                                      gradient: LinearGradient(colors: [
                                        // Colors.blue.shade400,
                                        // // Colors.blue.shade900,
                                        // Colors.green,
                                        // Colors.white,
                                        // Colors.white,

                                        Colors.deepOrangeAccent,
                                        Colors.orange,
                                        // Colors.deepPurple.shade400,
                                        //
                                        // Colors.white,
                                        // Colors.deepPurple.shade400,
                                      ]),
                                    ),
                                  ],
                                ),
                              ),
                      )),

                  // ProfileContainerOdd(
                  //   // customOnTap:
                  //   // () {
                  //   //   setState(() {
                  //   //     if(chosenBox != Boxes.industry) {
                  //   //       return
                  //   //           /// TODO return the normal box for all of the other widgets?
                  //   //     } else {
                  //   //       return
                  //   //           /// TODO return the active box for just this widget, and close the other one.
                  //   //     }
                  //   //   });
                  //   // },
                  //   chosenBox: Boxes.industry,
                  //   cardTitle: 'Months In Industry',
                  //   unClickedWidget: Text(
                  //     '94',
                  //     style: TextStyle(
                  //         color: Colors.orangeAccent,
                  //         fontSize: 60.0,
                  //         fontWeight: FontWeight.bold),
                  //   ),
                  //   clickedTitle: 'Self Reported',
                  //   clickedWidget: Column(
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 8.0),
                  //         child: Text(
                  //           'Industry: Flutter Development',
                  //           style: TextStyle(
                  //               color: Colors.white,
                  //               fontFamily: ('Ovo'),
                  //               fontSize: 13.0,
                  //               fontWeight: FontWeight.bold),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileContainerOdd extends StatefulWidget {
  final String cardTitle;
  // final IconData iconData;
  final Widget unClickedWidget;
  final String clickedTitle;
  final Widget clickedWidget;
  // final VoidCallback customOnTap;

  Boxes chosenBox = Boxes.about;

  ProfileContainerOdd({
    required this.cardTitle,
    // required this.iconData,
    required this.unClickedWidget,
    required this.clickedTitle,
    required this.clickedWidget,
    required this.chosenBox,
    // required this.customOnTap,
  });

  @override
  _ProfileContainerOddState createState() => _ProfileContainerOddState();
}

class _ProfileContainerOddState extends State<ProfileContainerOdd> {
  // bool wasClicked = false;

  bool didClickSeeCardDetail = false;

  get chosenBox => chosenBox;

  get customOnTap => customOnTap;

  // get chosenBox => chosenBox;

  // get clickedTitle => clickedTitle;
  //
  // get clickedWidget => null;

  // get clickedWidget => clickedWidget;

  Widget changeCardDetail(Widget firstCard, Widget secondCard) {
    if (didClickSeeCardDetail == false) {
      return firstCard;
    } else {
      return secondCard;
    }
  }

  /// TODO thinking about doing this differently.
  Widget showCardData() {
    if (didClickSeeCardDetail == false) {
      return Container(
        color: Colors.white10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.cardTitle.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: ('Ovo'),
                fontSize: 14.0,
              ),
            ),
            widget.unClickedWidget,
            // Icon(
            //   widget.iconData,
            //   color: Colors.deepPurpleAccent,
            //   size: 70.0,
            // ),
          ],
        ),
      );
    } else {
      return Container(
        color: Colors.orangeAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.clickedTitle.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontFamily: ('Ovo'),
                fontSize: 14.0,
              ),
            ),
            widget.clickedWidget,
          ],
        ),
      );
    }
  }

  //
  // Widget provideCardData(){
  //
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          didClickSeeCardDetail = !didClickSeeCardDetail;
        });
      },
      // onTap: customOnTap,

      child: showCardData(),
      // child: changeCardDetail(
      //   Container(
      //     color: Colors.white10,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           widget.cardTitle.toUpperCase(),
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontFamily: ('Ovo'),
      //             fontSize: 14.0,
      //           ),
      //         ),
      //         widget.unClickedWidget,
      //         // Icon(
      //         //   widget.iconData,
      //         //   color: Colors.deepPurpleAccent,
      //         //   size: 70.0,
      //         // ),
      //       ],
      //     ),
      //   ),
      //   Container(
      //     color: Colors.white24,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Text(
      //           widget.clickedTitle.toUpperCase(),
      //           style: TextStyle(
      //             color: Colors.white,
      //             fontFamily: ('Ovo'),
      //             fontSize: 14.0,
      //           ),
      //         ),
      //         widget.clickedWidget,
      //       ],
      //     ),
      //   ),
      // ),
      // child: Container(
      //   color: Colors.white10,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text(
      //         widget.cardTitle.toUpperCase(),
      //         style: TextStyle(
      //           color: Colors.white,
      //           fontFamily: ('Ovo'),
      //           fontSize: 14.0,
      //         ),
      //       ),
      //       Icon(
      //         widget.iconData,
      //         color: Colors.deepPurpleAccent,
      //         size: 70.0,
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

/// this project used to have even and odd profile container widgets, but now we are just using 1 widget for all
///four of the fo the profile squares.
//
class ProfileContainer extends StatelessWidget {
  final Widget cardBody;
  final VoidCallback customOnTap;

  ProfileContainer({
    required this.cardBody,
    required this.customOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: customOnTap,
      child: Container(
        // color: kInactiveCardColor,
        child: cardBody,
      ),
    );
  }
}
