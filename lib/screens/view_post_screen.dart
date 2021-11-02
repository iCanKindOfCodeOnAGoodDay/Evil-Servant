import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/screens/write_comment_screen.dart';
import 'package:evl_srvnt1/widgets/bottom_bar.dart';
import 'package:evl_srvnt1/widgets/post_widget.dart';
import 'package:evl_srvnt1/widgets/questions_widget.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'mobster_profile_screen.dart';
import 'package:evl_srvnt1/widgets/next_page_button.dart';

class ViewPostScreen extends StatefulWidget {
  @override
  _ViewPostScreenState createState() => _ViewPostScreenState();
}

class _ViewPostScreenState extends State<ViewPostScreen> {
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: kInactiveCardColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Full Post',
                    style: kReusableDetailCardTitle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Icon(
                  //       Icons.location_on_sharp,
                  //       size: 20.0,
                  //       color: Colors.white,
                  //     ),
                  //     Text(
                  //       'Showing nationwide posts',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 13.0,
                  //         fontFamily: ('FiraSansExtraCondensed'),
                  //         // fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //     RawMaterialButton(
                  //       onPressed: () {
                  //         // do something on pressed
                  //       },
                  //       child: Text(
                  //         '  see local posts only?',
                  //         style: TextStyle(
                  //           color: Colors.orangeAccent,
                  //           fontSize: 12.0,
                  //           // fontWeight: FontWeight.bold,
                  //           fontFamily: ('FiraSansExtraCondensed'),
                  //           // fontWeight: FontWeight.bold,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: [
                      Text(
                        'Posted 10.25.21',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: ('Ovo'),
                            fontSize: 13.0),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        FontAwesomeIcons.reply,
                        color: Colors.white,
                        size: 20.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WriteCommentScreen()));
                        },
                        child: Text(
                          'write a new comment',
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontFamily: ('FiraSansExtraCondensed'),
                              fontSize: 13.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ],
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
      body: Column(
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
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: BrowseListOption(
                      cardType: 'Master Jedi Knight',
                      totalRatings: '631',
                      ratingScore: 5,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Obi-Wan',
                      // buttonColor: kInactiveCardColor,
                      buttonColor: Colors.deepOrangeAccent,

                      labelTextColor: Colors.white,
                      buttonLabel: ('write comment'),
                      isIllegalLineThrough: TextDecoration.none,
                      legallnessIcon: FontAwesomeIcons.reply,
                      legallnessIconColor: Colors.orange,
                      cardDetail: 'Sith Lords Are My Speciality.',
                      isAvailable: true,
                      cardArtCode: 821,
                      onButtonTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WriteCommentScreen()));
                      },
                      isProfileCardChild: PostWidget(
                        isOpen: true,
                        postTitle:
                            'Luke was just a selfish little brat when I started training him.',
                        postBody:
                            'But we all know that he turned out alright-ish. Looks like my track record ain\'t that bad after all.',
                      ),
                    ),
                  ),
                ),

                /// below is the next button which i dont think we need for a single post view.
                // ListTile(
                //   title: ListTile(
                //     title: Container(
                //       height: 100.0,
                //       child: RawMaterialButton(
                //         onPressed: () {
                //           // Navigator.pop(context);
                //           print('do something on pressed');
                //           Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => ViewPostScreen()));
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.all(10.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             children: [
                //               Icon(
                //                 Icons.arrow_forward,
                //                 color: Colors.white,
                //               ),
                //               Text(
                //                 'next',
                //                 style: TextStyle(color: Colors.white),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),

                ///TODO remove the duplicates
                ListTile(
                  title: manageBuildingBottomWidgets(),
                ),
                // ListTile(title: SizedBox(height: 100.0)),
                ListTile(
                  title: SizedBox(
                    height: 70.0,
                  ),
                ),
              ],
            ),
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: FloatingActionButton(
          //     backgroundColor: Colors.deepPurpleAccent,
          //     onPressed: () {
          //       // do something on pressed
          //     },
          //     child: Icon(
          //       Icons.add,
          //       color: Colors.white,
          //       size: 40.0,
          //     ),
          //   ),
          // ),
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

          // DynamicBottomBar(chosenButton: Buttons.posts),
        ],
      ),
    );
  }
}
