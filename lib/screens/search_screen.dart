import 'package:evl_srvnt1/widgets/questions_widget.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'reusable_browse_mobsters_screen.dart';
import 'package:evl_srvnt1/constants.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //// create a switch for the search bar
  //// what variables are needed?

  bool searchShouldBeOpen = true;

  bool showQuestionsWidget = true;

  Widget manageBuildingBottomWidgets() {
    if (showQuestionsWidget == true) {
      return QuestionsWidget();
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 90.0),
        child: Container(),
        // GestureDetector(
        //   onTap: () {
        //     ////
        //     setState(() {
        //       showQuestionsWidget = true;
        //     });
        //   },
        //   child: Row(
        //     children: [
        //       Icon(
        //         Icons.arrow_circle_down,
        //         size: 60.0,
        //         color: Colors.white10,
        //       ),
        //     ],
        //   ),
        // ),
      );
    }
  }

  Widget manageOpeningAndClosingTopBar() {
    if (searchShouldBeOpen == true) {
      return Container(
        color: kInactiveCardColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search',
                style: kReusableDetailCardTitle,
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
                    'Here you\'ll find the talented people you are looking for.',
                    // 'Do it if you wanna',
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
                      'change location?',
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
      return Container(
        color: Colors.black,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  setState(() {
                    searchShouldBeOpen = true;
                  });
                },
                child: Icon(
                  Icons.arrow_circle_up,
                  color: Colors.white10,
                  size: 60.0,
                ),
              ),
            )
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color:
                searchShouldBeOpen == true ? kInactiveCardColor : Colors.black,
            height: 40.0,
          ),
          manageOpeningAndClosingTopBar(),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: BrowseListOption(
                      cardType: '4749 Servants Near You',
                      totalRatings: '789k',
                      ratingScore: 5,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Search for the skilled people you need',
                      // buttonColor: Colors.deepPurple.shade400,
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('View Search Results'),
                      isIllegalLineThrough: TextDecoration.none,
                      legallnessIcon: Icons.list,
                      legallnessIconColor: Colors.orange,
                      cardDetail: 'Find them now.',
                      isAvailable: true,
                      cardArtCode: 913,
                      onButtonTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ReusableServiceOptionScreen(
                                      serviceTitle: ('Search Results'),
                                      cardType: 'Evil Servant',
                                      serviceDescription:
                                          ('Searching for \'Search Term\'.'),
                                      screenChild: Container(
                                        height: 50.0,
                                        width: 50.0,
                                        color: Colors.red,
                                      ),
                                      goToNextPage: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ReusableServiceOptionScreen(
                                                      serviceTitle:
                                                          ('Search Results'),
                                                      cardType: 'Evil Servant',
                                                      serviceDescription:
                                                          ('Searching for \'Search Term\'.'),
                                                      screenChild: Container(
                                                        height: 50.0,
                                                        width: 50.0,
                                                        color: Colors.red,
                                                      ),
                                                      goToNextPage: () {
                                                        print(
                                                            'got to next page');
                                                      },
                                                    )));
                                      },
                                    )));
                      },

                      /// , we need a switch to change the type of card
                      isProfileCardChild: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextField(
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());

                                setState(() {
                                  if (searchShouldBeOpen == false) {
                                    searchShouldBeOpen = !searchShouldBeOpen;
                                    showQuestionsWidget = !showQuestionsWidget;
                                  }
                                });
                              },
                              onTap: () {
                                setState(() {
                                  if (searchShouldBeOpen == true) {
                                    searchShouldBeOpen = !searchShouldBeOpen;
                                    showQuestionsWidget = !showQuestionsWidget;
                                  }
                                });

                                /// TODO call a fumnction here that ultimately changes the search bar to a closed state
                                /// so a few things must happen to do this
                                /// 1. There has to be an open and closed widget for the topBar
                                /// 2. onTap in the text field has to somehow call this function and change the topBar
                                /// 3. when you are done typing the top bar should return to view
                              },
                              obscureText: false,
                              // onSubmitted: (String nothing) {
                              //   Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //           builder: (context) =>
                              //               ReusableServiceOptionScreen(
                              //                 serviceTitle: ('Search Results'),
                              //                 cardType: 'Evil Servant',
                              //                 serviceDescription:
                              //                     ('Searching for \'Search Term\'.'),
                              //                 screenChild: Container(
                              //                   height: 50.0,
                              //                   width: 50.0,
                              //                   color: Colors.red,
                              //                 ),
                              //                 goToNextPage: () {
                              //                   Navigator.push(
                              //                       context,
                              //                       MaterialPageRoute(
                              //                           builder: (context) =>
                              //                               ReusableServiceOptionScreen(
                              //                                 serviceTitle:
                              //                                     ('Search Results'),
                              //                                 cardType:
                              //                                     'Evil Servant',
                              //                                 serviceDescription:
                              //                                     ('Searching for \'Search Term\'.'),
                              //                                 screenChild:
                              //                                     Container(
                              //                                   height: 50.0,
                              //                                   width: 50.0,
                              //                                   color:
                              //                                       Colors.red,
                              //                                 ),
                              //                                 goToNextPage: () {
                              //                                   print(
                              //                                       'got to next page');
                              //                                 },
                              //                               )));
                              //                 },
                              //               )));
                              // },
                              style: TextStyle(color: Colors.white),

                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'search for skills',
                                hintStyle:
                                    TextStyle(color: Colors.orangeAccent),
                                filled: true,
                                icon: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                                labelText: 'start typing',
                                labelStyle: TextStyle(color: Colors.white),
                                fillColor: kInactiveCardColor,
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                ListTile(
                  title: manageBuildingBottomWidgets(),
                ),
                ListTile(
                  title: Container(
                    height: 150.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // SizedBox(
                        //   height: 50.0,
                        // ),
                        Container(
                          child: RawMaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(

                                  /// PADDING set differently for this back button
                                  /// because this one is inside a listView
                                  top: 10.0,
                                  bottom: 10.0,
                                  right: 10.0),
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
                          height: 100.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          ///TODO this is the spot the back button used to be
          /// now it is going inside of the listview,
          /// because previously it was causing a keyboard issue
          /// the back button was raising to above the keyboard when kb opened
          /// and covering the submit button to complete the search
          /// so it will be moved inside the list view for now
          /// untill a better solution which allows the
          /// back button to be the exact same as the rest of the app is thought of
        ],
      ),
    );
  }
}
