import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/screens/reusable_browse_mobsters_screen.dart';
import 'package:evl_srvnt1/screens/search_screen.dart';
import 'package:evl_srvnt1/widgets/bottom_bar.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:evl_srvnt1/widgets/evil_top_bar.dart';
import 'package:evl_srvnt1/widgets/questions_widget.dart';
import 'package:flutter/material.dart';

/// this whole thing should be a stateful widget
/// because we want to update the _topBar() when scrolled
/// but we have since changed our mind

class BrowseScreen extends StatefulWidget {
  @override
  _BrowseScreenState createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
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
                'Evil Services',
                style: kReusableDetailCardTitle,
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outlined,
                    size: 20.0,
                    color: Colors.deepPurple,
                  ),
                  Text(
                    'Confidentially Delivered',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontFamily: ('FiraSansExtraCondensed'),
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Icon(
              //       Icons.check_circle_outlined,
              //       size: 20.0,
              //       color: Colors.deepPurple,
              //     ),
              //     Text(
              //       'DNC Protected',
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 13.0,
              //         fontFamily: ('FiraSansExtraCondensed'),
              //         // fontWeight: FontWeight.bold,
              //       ),
              //     ),
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outlined,
                    size: 20.0,
                    color: Colors.deepPurple,
                  ),
                  Text(
                    'Paid In-App',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontFamily: ('FiraSansExtraCondensed'),
                      // fontWeight: FontWeight.bold,
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
      backgroundColor: Colors.black54,
      body: Container(
        // color: Colors.lightBlueAccent,
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// lets try removing the evil top bar and instead
              /// putting the legend on the top of the page
              // EvilTopBar(),
              Container(
                color: showTopBar == true ? kInactiveCardColor : Colors.black,
                height: 40.0,
              ),

              /// put the custom top container here
              manageBuildingTopBarWidgets(),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: ListView(
                    controller: _controller,
                    children: [
                      ListTile(
                        title: Container(
                          // height: 450.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // BrowseListOption(
                              //   totalRatings: '57k',
                              //   ratingScore: 4,
                              //   isSearchCard: false,
                              //
                              //   isProfileCard: false,
                              //   isProfileCardChild: Container(),
                              //
                              //   cardTitle: 'Get A Fixer',
                              //   buttonColor: Colors.deepPurpleAccent,
                              //   labelTextColor: Colors.white,
                              //   buttonLabel: ('Get A Fixer'),
                              //   isIllegalLineThrough: TextDecoration.none,
                              //   legallnessIcon: Icons.check_circle_outlined,
                              //   legallnessIconColor: Colors.deepPurple,
                              //   cardDetail:
                              //       'Problem? No problem. Have a Fixer take care of you like the good old days.',
                              //   isAvailable: true,
                              //   cardArtCode: 913,
                              //   onButtonTap: () {
                              //     print('Fixer button tapped');
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) =>
                              //                 ReusableServiceOptionScreen(
                              //                   serviceTitle: ('Get A Fixer'),
                              //                   cardType: 'Evil Servant',
                              //                   serviceDescription:
                              //                       ('Below is a list of available Fixers'),
                              //                   screenChild: Container(
                              //                     height: 50.0,
                              //                     width: 50.0,
                              //                     color: Colors.red,
                              //                   ),
                              //                   goToNextPage: () {
                              //                     print('got to next page');
                              //                     Navigator.push(
                              //                         context,
                              //                         MaterialPageRoute(
                              //                             builder: (context) =>
                              //                                 ReusableServiceOptionScreen(
                              //                                   serviceTitle:
                              //                                       ('Get A Fixer'),
                              //                                   cardType:
                              //                                       'Evil Servant',
                              //                                   serviceDescription:
                              //                                       ('Below is a list of available Fixers'),
                              //                                   screenChild:
                              //                                       Container(
                              //                                     height: 50.0,
                              //                                     width: 50.0,
                              //                                     color: Colors
                              //                                         .red,
                              //                                   ),
                              //                                   goToNextPage:
                              //                                       () {
                              //                                     print(
                              //                                         'got to next page');
                              //                                   },
                              //                                 )));
                              //                   },
                              //                 )));
                              //   },
                              //
                              //   /// passed in the incorrect card code here to change the image back to inactive,
                              //   /// because inactive image looks so much better lol
                              //   /// but that being said, now the images are 'dynamic' if we want them to be
                              // ),
                              BrowseListOption(
                                cardType: 'Top 50 near you',

                                totalRatings: '273k',
                                ratingScore: 5,
                                isSearchCard: false,

                                isProfileCard: false,

                                isProfileCardChild: Container(),

                                cardTitle: 'Trending Now',
                                // buttonColor: Colors.deepPurple.shade400,
                                buttonColor: kSexyOrangeButtonColor,

                                labelTextColor: Colors.white,
                                buttonLabel: ('Hot Evil Servants Near You'),
                                isIllegalLineThrough: TextDecoration.none,
                                legallnessIcon: Icons.check_circle_outlined,
                                legallnessIconColor: Colors.orange,
                                cardDetail:
                                    'Browse skilled locals from diverse backgrounds and industries on the top 50.',
                                isAvailable: true,
                                cardArtCode: 913,
                                onButtonTap: () {
                                  print('Other button tapped');
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ReusableServiceOptionScreen(
                                                serviceTitle:
                                                    ('Trending Servants'),
                                                cardType: 'Evil Servant',
                                                serviceDescription:
                                                    ('Below you will find a list of various services offered.'),
                                                screenChild: Container(
                                                  height: 50.0,
                                                  width: 50.0,
                                                  color: Colors.red,
                                                ),
                                                goToNextPage: () {
                                                  print('got to next page');
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ReusableServiceOptionScreen(
                                                                serviceTitle:
                                                                    ('More Servants'),
                                                                cardType:
                                                                    'Evil Servant',
                                                                serviceDescription:
                                                                    ('Below you will find a list of various services offered.'),
                                                                screenChild:
                                                                    Container(
                                                                  height: 50.0,
                                                                  width: 50.0,
                                                                  color: Colors
                                                                      .red,
                                                                ),
                                                                goToNextPage:
                                                                    () {
                                                                  print(
                                                                      'got to next page');
                                                                },
                                                              )));
                                                },
                                              )));
                                },

                                /// passed in the incorrect card code here to change the image back to inactive,
                                /// because inactive image looks so much better lol
                                /// but that being said, now the images are 'dynamic' if we want them to be
                              ),
                              BrowseListOption(
                                cardType: '4749 Servants Near You',
                                totalRatings: '789k',
                                ratingScore: 5,
                                isSearchCard: false,
                                isProfileCard: false,
                                isProfileCardChild: Container(),
                                cardTitle: 'Search Terms',
                                buttonColor: kSexyOrangeButtonColor,
                                labelTextColor: Colors.white,
                                buttonLabel: ('Search For Specific Skills'),
                                isIllegalLineThrough: TextDecoration.none,
                                legallnessIcon: Icons.check_circle_outlined,
                                legallnessIconColor: Colors.orange,
                                cardDetail:
                                    'Search for locals who have the skills you need that\'ll jump on it for their Evil Rate.',
                                isAvailable: true,
                                cardArtCode: 913,
                                onButtonTap: () {
                                  print('Search button tapped');
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           ReusableServiceOptionScreen(
                                  //               serviceTitle: ('Search'),
                                  //               cardType: 'Search',
                                  //               serviceDescription:
                                  //                   ('Below is a list of available Search'),
                                  //               screenChild: Container(
                                  //                 height: 50.0,
                                  //                 width: 50.0,
                                  //                 color: Colors.red,
                                  //               ))),
                                  // );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SearchScreen(),
                                      ));
                                },
                              ),
                              // BrowseListOption(
                              //   isProfileCard: false,
                              //   isProfileCardChild: Container(),
                              //   cardTitle: 'Send Em The Message',
                              //   buttonColor: Colors.white12,
                              //   labelTextColor: Colors.white,
                              //   buttonLabel: ('Send Em The Message'),
                              //   isIllegalLineThrough:
                              //       TextDecoration.lineThrough,
                              //   legallnessIcon: Icons.close,
                              //   legallnessIconColor: Colors.yellow,
                              //   cardDetail:
                              //       // 'Hand delivered package containing top quality prepped and primed fart pouches opened in proximity to face',
                              //       'Sorry, but that is not allowed. Note** Must request sitdown prior. A whack cost is 10x regular rate**',
                              //   isAvailable: false,
                              //   cardArtCode: 914,
                              //   onButtonTap: () {
                              //     print('hitman button tapped');
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: manageBuildingBottomWidgets(),
                      ),
                      // ),
                    ],
                  ),
                ),
              ),
              DynamicBottomBar(chosenButton: Buttons.browse),
            ],
          ),
        ),
      ),
    );
  }
}
