import 'dart:ffi';

import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/screens/mobster_profile_screen.dart';
import 'package:evl_srvnt1/widgets/next_page_button.dart';
import 'package:evl_srvnt1/widgets/questions_widget.dart';
import 'package:flutter/material.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';

class ReusableServiceOptionScreen extends StatefulWidget {
  final String serviceTitle;
  final String serviceDescription;
  final Widget screenChild;
  final String cardType;
  final VoidCallback goToNextPage;

  ReusableServiceOptionScreen(
      {required this.serviceTitle,
      required this.serviceDescription,
      required this.screenChild,
      required this.cardType,
      required this.goToNextPage});

  @override
  _ReusableServiceOptionScreenState createState() =>
      _ReusableServiceOptionScreenState();
}

class _ReusableServiceOptionScreenState
    extends State<ReusableServiceOptionScreen> {
  bool showTopBar = true;

  bool showQuestionsWidget = false;

  late ScrollController _controller;

  // void navigateScreen() {
  //   widget.goToNextPage;
  // }

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
        showTopBar = true;
        showQuestionsWidget = false;
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
                widget.serviceTitle,
                style: kReusableDetailCardTitle,
                // TextStyle(
                //     color: Colors.white,
                //     fontSize: 25.0,
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
                    Icons.question_answer,
                    size: 20.0,
                    color: Colors.deepPurpleAccent,
                  ),
                  Text(
                    widget.serviceDescription,
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
                    Icons.location_on_sharp,
                    size: 20.0,
                    color: Colors.white,
                  ),
                  Text(
                    'Showing results for Santa Clarita, CA',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontFamily: ('FiraSansExtraCondensed'),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  RawMaterialButton(
                    onPressed: () {
                      // do something on pressed
                    },
                    child: Text(
                      '  change location?',
                      style: TextStyle(
                        color: Colors.orangeAccent,
                        fontSize: 12.0,
                        // fontWeight: FontWeight.bold,
                        fontFamily: ('FiraSansExtraCondensed'),
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
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
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.black54,
      //   title: Text(
      //     'Do A Fixing',
      //     style: TextStyle(color: Colors.white),
      //   ),
      // ),
      backgroundColor: Colors.black54,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
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
                    DynamicListTileBody(
                      cardType: widget.cardType,
                    ),
                    ListTile(
                      title: Container(
                        height: 100.0,
                        child: NextPageButton(nextScreen: () {
                          print('do something');
                          widget.goToNextPage();
                        }),
                      ),
                    ),
                    ListTile(
                      title: manageBuildingBottomWidgets(),
                    ),
                  ],
                ),
              ),
              Container(
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
        ),
      ),
    );
  }
}

class DynamicListTileBody extends StatelessWidget {
  final String cardType;

  DynamicListTileBody({required this.cardType});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BrowseListOption(
              cardType: 'Force Warrior',
              totalRatings: '231',
              ratingScore: 5,
              isSearchCard: false,
              isProfileCard: true,
              isProfileCardChild: Container(),
              cardTitle: 'Ashoka Tano',
              buttonColor: kSexyOrangeButtonColor,
              // Colors.deepPurple.shade600,
              labelTextColor: Colors.white,
              buttonLabel: ('View profile'),
              isIllegalLineThrough: TextDecoration.none,
              legallnessIcon: Icons.account_circle,
              legallnessIconColor: Colors.orange,
              cardDetail:
                  'I\'ve got two light sabers, one for the each of you.',
              isAvailable: true,
              cardArtCode: 822,
              onButtonTap: () {
                print('Score button tapped');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobsterProfileScreen(
                        mobsterMaxWage: 54.95,
                        totalRatings: '231',
                        ratingScore: 5,
                        imageCode: 822,
                        skills:
                            'I\'ve got two light sabers, one for the each of you.',
                        name: 'Ashoka Tano',
                        cardType: 'Force Warrior',
                      ),
                    ));
              },
            ),
            BrowseListOption(
              cardType: 'Master Jedi Knight',
              totalRatings: '631',
              ratingScore: 5,
              isSearchCard: false,
              isProfileCard: false,
              isProfileCardChild: Container(),
              cardTitle: 'Obi-Wan',
              buttonColor: kSexyOrangeButtonColor,
              labelTextColor: Colors.white,
              buttonLabel: ('View profile'),
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
                      builder: (context) => MobsterProfileScreen(
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
            BrowseListOption(
              cardType: 'Smuggler',
              totalRatings: '13',
              ratingScore: 2,
              isSearchCard: false,
              isProfileCard: false,
              isProfileCardChild: Container(),
              cardTitle: 'Han Solo',
              buttonColor: kSexyOrangeButtonColor,
              labelTextColor: Colors.white,
              buttonLabel: ('View profile'),
              isIllegalLineThrough: TextDecoration.none,
              legallnessIcon: Icons.account_circle,
              legallnessIconColor: Colors.orange,
              cardDetail: 'Who shot first?',
              isAvailable: true,
              cardArtCode: 823,
              onButtonTap: () {
                print('Score button tapped');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobsterProfileScreen(
                        mobsterMaxWage: 1300,
                        totalRatings: '13',
                        ratingScore: 2,
                        imageCode: 823,
                        skills: 'Who shot first?',
                        name: 'Han Solo',
                        cardType: 'Smuggler',
                      ),
                    ));
              },
            ),
            BrowseListOption(
              cardType: 'Sith Lord',
              totalRatings: '8.6k',
              ratingScore: 3,
              isSearchCard: false,
              isProfileCard: false,
              isProfileCardChild: Container(),
              cardTitle: 'Sheev Palpatine',
              buttonColor: kSexyOrangeButtonColor,
              labelTextColor: Colors.white,
              buttonLabel: ('View profile'),
              isIllegalLineThrough: TextDecoration.none,
              legallnessIcon: Icons.account_circle,
              legallnessIconColor: Colors.orange,
              cardDetail:
                  'You have only began to learn the power of the dark side of the force.',
              isAvailable: true,
              cardArtCode: 824,
              onButtonTap: () {
                print('Score button tapped');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobsterProfileScreen(
                        mobsterMaxWage: 5000,
                        totalRatings: '8.6k',
                        ratingScore: 3,
                        imageCode: 824,
                        skills:
                            'You have only began to learn the power of the dark side of the force.',
                        name: 'Sheev Palpatine',
                        cardType: 'Sith Lord',
                      ),
                    ));
              },
            ),
            BrowseListOption(
              cardType: 'Bounty Hunter',

              totalRatings: '35',
              ratingScore: 5,
              isSearchCard: false,
              isProfileCard: false,
              isProfileCardChild: Container(),
              //
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 20.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         cardType,
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontFamily: ('BebasNeue'),
              //             fontSize: 15.0),
              //       ),
              //     ],
              //   ),
              // ),
              cardTitle: 'Mando',
              buttonColor: kSexyOrangeButtonColor,
              // Colors.deepPurpleAccent,
              labelTextColor: Colors.white,
              buttonLabel: ('View profile'),
              isIllegalLineThrough: TextDecoration.none,
              legallnessIcon: Icons.account_circle,
              legallnessIconColor: Colors.orange,
              cardDetail:
                  'Shooting, Stabbing, Flame Throwing, Etc. BOUNTY HUNTER FOR HIRE',
              isAvailable: true,
              cardArtCode: 825,
              onButtonTap: () {
                print('Score button tapped');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobsterProfileScreen(
                        mobsterMaxWage: 1500,
                        totalRatings: '35',
                        ratingScore: 5,
                        imageCode: 825,
                        skills:
                            'Shooting, Stabbing, Flame Throwing, Etc. BOUNTY HUNTER FOR HIRE',
                        name: 'Mando',
                        cardType: 'Bounty Hunter',
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
