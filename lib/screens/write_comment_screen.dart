import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/screens/posts_landing_screen.dart';
import 'package:evl_srvnt1/screens/view_post_screen.dart';
import 'package:evl_srvnt1/widgets/bottom_bar.dart';
import 'package:evl_srvnt1/widgets/post_widget.dart';
import 'package:evl_srvnt1/widgets/questions_widget.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'mobster_profile_screen.dart';
import 'package:evl_srvnt1/widgets/next_page_button.dart';

class WriteCommentScreen extends StatefulWidget {
  @override
  _WriteCommentScreenState createState() => _WriteCommentScreenState();
}

class _WriteCommentScreenState extends State<WriteCommentScreen> {
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
                    'Write A Comment',
                    style: kReusableDetailCardTitle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.question_answer,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      Text(
                        'Interacting via your Servant account.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: ('FiraSansExtraCondensed'),
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      GestureDetector(
                        onTap: () {
                          // do something on pressed
                        },
                        child: Text(
                          'Switch to Boss?',
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

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Icon(
                  //       Icons.question_answer,
                  //       color: Colors.white,
                  //       size: 20.0,
                  //     ),
                  //     SizedBox(
                  //       width: 5.0,
                  //     ),
                  //     Text(
                  //       'Racism and other prejudice will not be tolerated',
                  //       style: TextStyle(
                  //           color: Colors.white,
                  //           fontFamily: ('Ovo'),
                  //           fontSize: 13.0),
                  //     ),
                  //   ],
                  // ),
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
                        buttonColor: kSexyOrangeButtonColor,
                        labelTextColor: Colors.white,
                        buttonLabel: ('Publish Comment'),
                        isIllegalLineThrough: TextDecoration.none,
                        legallnessIcon: Icons.post_add,
                        legallnessIconColor: Colors.orange,
                        cardDetail: 'Sith Lords Are My Speciality.',
                        isAvailable: true,
                        cardArtCode: 821,
                        onButtonTap: () {
                          print('Score button tapped');
                          Navigator.pop(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => ViewPostScreen()));
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => MobsterProfileScreen(
                          //         mobsterMaxWage: 595,
                          //         totalRatings: '631',
                          //         ratingScore: 5,
                          //         imageCode: 821,
                          //         skills: 'Sith Lords Are My Speciality.',
                          //         name: 'Obi-Wan',
                          //         cardType: 'Master Jedi Knight',
                          //       ),
                          //     ));
                        },
                        isProfileCardChild: Column(
                          children: [
                            TextField(
                              obscureText: false,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'name it',
                                hintStyle:
                                    TextStyle(color: Colors.orangeAccent),
                                filled: true,
                                icon: Icon(
                                  Icons.title,
                                  //dwac - donald trump social network
                                  color: Colors.white,
                                ),
                                labelText: 'Comment Title',
                                labelStyle: TextStyle(color: Colors.white),
                                fillColor: kInactiveCardColor,
                              ),
                            ),
                            TextField(
                              keyboardType: TextInputType.text,
                              maxLines: 10,
                              maxLength: 300,
                              obscureText: false,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'write your comment',
                                hintStyle:
                                    TextStyle(color: Colors.orangeAccent),
                                filled: true,
                                icon: Icon(
                                  FontAwesomeIcons.globe,
                                  //dwac - donald trump social network
                                  color: Colors.white,
                                ),
                                labelText: '',
                                labelStyle: TextStyle(color: Colors.white),
                                fillColor: kInactiveCardColor,
                              ),
                            ),
                          ],
                        )

                        // PostWidget(
                        //     isOpen: true, postTitle: 'body', postBody: 'hello'),
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
                // ListTile(
                //   title: SizedBox(
                //     height: 70.0,
                //   ),
                // ),
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
