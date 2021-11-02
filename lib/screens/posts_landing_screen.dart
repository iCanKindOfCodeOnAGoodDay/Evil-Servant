import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/screens/write_post_screen.dart';
import 'package:evl_srvnt1/widgets/bottom_bar.dart';
import 'package:evl_srvnt1/widgets/post_widget.dart';
import 'package:evl_srvnt1/widgets/questions_widget.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:flutter/material.dart';

import 'mobster_profile_screen.dart';
import 'package:evl_srvnt1/widgets/next_page_button.dart';

class PostsLandingScreen extends StatefulWidget {
  @override
  _PostsLandingScreenState createState() => _PostsLandingScreenState();
}

class _PostsLandingScreenState extends State<PostsLandingScreen> {
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
                    'Posts',
                    style: kReusableDetailCardTitle,
                  ),
                  // SizedBox(
                  //   height: 10.0,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Icon(
                  //       Icons.question_answer,
                  //       size: 20.0,
                  //       color: Colors.deepPurpleAccent,
                  //     ),
                  //     Text(
                  //       'Browse posts by Bosses and Evil Servants',
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
                        Icons.question_answer,
                        size: 20.0,
                        color: Colors.deepPurpleAccent,
                      ),
                      Text(
                        'Showing nationwide posts',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: ('FiraSansExtraCondensed'),
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // do something on pressed
                        },
                        child: Text(
                          '  see following list posts?',
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
                  //       Icons.car_rental_outlined,
                  //       size: 20.0,
                  //       color: Colors.deepPurple,
                  //     ),
                  //     Text(
                  //       '= Will drive to you',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 13.0,
                  //         fontFamily: ('Ovo'),
                  //         // fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.post_add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      RawMaterialButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WritePostScreen()));
                        },
                        child: Text(
                          'write a new post',
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
      // appBar: AppBar(
      //   title: Text('hello'),
      // ),
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
                // ListTile(
                //   title:
                //   Column(
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       Container(
                //         color: Colors.white10,
                //         child: Padding(
                //           padding: const EdgeInsets.only(
                //               top: 5.0, left: 5.0, bottom: 5.0, right: 5.0),
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.stretch,
                //             children: [
                //               Text(
                //                 'Posts',
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontSize: 25.0,
                //                     fontWeight: FontWeight.bold,
                //                     fontFamily: ('Cinzel')),
                //               ),
                //               // SizedBox(
                //               //   height: 10.0,
                //               // ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   Icon(
                //                     Icons.question_answer,
                //                     size: 20.0,
                //                     color: Colors.deepPurpleAccent,
                //                   ),
                //                   Text(
                //                     'Browse posts by Bosses and Mobsters',
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 13.0,
                //                       fontFamily: ('FiraSansExtraCondensed'),
                //                       // fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.start,
                //                 children: [
                //                   Icon(
                //                     Icons.location_on_sharp,
                //                     size: 20.0,
                //                     color: Colors.white,
                //                   ),
                //                   Text(
                //                     'Showing nationwide posts',
                //                     style: TextStyle(
                //                       color: Colors.white,
                //                       fontSize: 13.0,
                //                       fontFamily: ('FiraSansExtraCondensed'),
                //                       // fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //                   RawMaterialButton(
                //                     onPressed: () {
                //                       // do something on pressed
                //                     },
                //                     child: Text(
                //                       '  see local posts only?',
                //                       style: TextStyle(
                //                         color: Colors.orangeAccent,
                //                         fontSize: 12.0,
                //                         // fontWeight: FontWeight.bold,
                //                         fontFamily: ('FiraSansExtraCondensed'),
                //                         // fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //               // Row(
                //               //   mainAxisAlignment: MainAxisAlignment.start,
                //               //   children: [
                //               //     Icon(
                //               //       Icons.car_rental_outlined,
                //               //       size: 20.0,
                //               //       color: Colors.deepPurple,
                //               //     ),
                //               //     Text(
                //               //       '= Will drive to you',
                //               //       style: TextStyle(
                //               //         color: Colors.white,
                //               //         fontSize: 13.0,
                //               //         fontFamily: ('Ovo'),
                //               //         // fontWeight: FontWeight.bold,
                //               //       ),
                //               //     ),
                //               //   ],
                //               // ),
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.end,
                //                 children: [
                //                   Icon(
                //                     Icons.post_add,
                //                     color: Colors.white,
                //                   ),
                //                   SizedBox(
                //                     width: 5.0,
                //                   ),
                //                   Text(
                //                     'write a post',
                //                     style: TextStyle(
                //                         color: Colors.deepPurpleAccent),
                //                   ),
                //                 ],
                //               ),
                //               SizedBox(
                //                 height: 5.0,
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                ///TODO remove the old code here
                // ListTile(
                //   title: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       Icon(
                //         Icons.post_add,
                //         color: Colors.white,
                //       ),
                //       SizedBox(
                //         width: 5.0,
                //       ),
                //       Text(
                //         'write a post',
                //         style: TextStyle(color: Colors.deepPurpleAccent),
                //       )
                //     ],
                //   ),
                // ),
                // ListTile(
                //   title: PostWidget(),
                // ),
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
                      // buttonColor: Colors.deepPurple.shade400,
                      buttonColor: kSexyOrangeButtonColor,

                      // Colors.deepPurpleAccent,
                      labelTextColor: Colors.white,
                      buttonLabel: ('view profile'),
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
                                mobsterMaxWage: 595,
                                totalRatings: '631',
                                ratingScore: 5,
                                imageCode: 821,
                                skills: 'Sith Lords Are My Speciality.',
                                name: 'Obi-Wan',
                                cardType: 'Master Jedi Knight',
                              ),
                            ));
                      },
                      isProfileCardChild: PostWidget(
                        isOpen: false,
                        postTitle:
                            'Luke was just a selfish little brat when I started training him.',
                        postBody:
                            'But we all know that he turned out alright-ish. Looks like my track record ain\'t that bad after all.',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: BrowseListOption(
                      cardType: 'Force Warrior',
                      totalRatings: '231',
                      ratingScore: 5,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Ashoka Tano',
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('view profile'),
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
                                mobsterMaxWage: 295,
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
                      isProfileCardChild: PostWidget(
                        isOpen: false,
                        postTitle:
                            'Thinks Of A Good Post Title Ashoka Does Not',
                        postBody:
                            'Then she just straight up goes off about not just the sith and the people who follow them but also about the separatists. Like girl, how long ago? Are you really going to go there?',
                      ),
                    ),
                  ),
                ),

                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: BrowseListOption(
                      cardType: 'Sith Lord',
                      totalRatings: '8.6k',
                      ratingScore: 3,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Sheev Palpatine',
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('view profile'),
                      isIllegalLineThrough: TextDecoration.none,
                      legallnessIcon: Icons.account_circle,
                      legallnessIconColor: Colors.orange,
                      cardDetail:
                          'You have only began to learn the power of the Dark Side of the Force.',
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
                                    'You have only began to learn the power of the Dark Side of the Force.',
                                name: 'Sheev Palpatine',
                                cardType: 'Sith Lord',
                              ),
                            ));
                      },
                      isProfileCardChild: PostWidget(
                        isOpen: false,
                        postTitle:
                            'I would like to watch this Obi Wan character try and do something.',
                        postBody:
                            'But then again, he wasn\'t even a match for Dooku. Old Ben would last about 15 seconds before I got tired of playing with him.',
                      ),
                    ),
                  ),
                ),

                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: BrowseListOption(
                      cardType: 'Smuggler',
                      totalRatings: '13',
                      ratingScore: 2,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Han Solo',
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('view profile'),
                      isIllegalLineThrough: TextDecoration.none,
                      legallnessIcon: Icons.account_circle,
                      legallnessIconColor: Colors.orange,
                      cardDetail: 'Kessel Run in 13 Parsecs',
                      isAvailable: true,
                      cardArtCode: 823,
                      onButtonTap: () {
                        print('Score button tapped');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MobsterProfileScreen(
                                mobsterMaxWage: 595,
                                totalRatings: '13',
                                ratingScore: 2,
                                imageCode: 823,
                                skills: 'Kessel Run in 13 Parsecs',
                                name: 'Han Solo',
                                cardType: 'Money Maker',
                              ),
                            ));
                      },
                      isProfileCardChild: PostWidget(
                        isOpen: false,
                        postTitle: 'HELP WANTED FAST STARSHIP',
                        postBody:
                            'Experienced mechanic wanted as third shipmate on the fastest ship in the Galaxy',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: BrowseListOption(
                      cardType: 'Force Warrior',
                      totalRatings: '231',
                      ratingScore: 5,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Ashoka Tano',
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('view profile'),
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
                                mobsterMaxWage: 295,
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
                      isProfileCardChild: PostWidget(
                          isOpen: false,
                          postTitle:
                              'Okay yes Ezra and I were pretty close but i\'m just like that with all my friends and i just want to clear the air',
                          postBody:
                              'nothing ever happened. stop guessing people. mind your business. not mine.'),
                    ),
                  ),
                ),

                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: BrowseListOption(
                      cardType: 'Sith Lord',
                      totalRatings: '8.6k',
                      ratingScore: 3,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Sheev Palpatine',
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('view profile'),
                      isIllegalLineThrough: TextDecoration.none,
                      legallnessIcon: Icons.account_circle,
                      legallnessIconColor: Colors.orange,
                      cardDetail:
                          'You have only began to learn the power of the Dark Side of the Force.',
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
                                    'You have only began to learn the power of the Dark Side of the Force.',
                                name: 'Sheev Palpatine',
                                cardType: 'Sith Lord',
                              ),
                            ));
                      },
                      isProfileCardChild: PostWidget(
                        isOpen: false,
                        postTitle:
                            'The might of the Empire has never before been stronger than now',
                        postBody:
                            'And to those who would stand against our great Empire: you will perish into dust.',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: BrowseListOption(
                      cardType: 'Master Jedi Knight',
                      totalRatings: '631',
                      ratingScore: 5,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Obi-Wan',
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('view profile'),
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
                                mobsterMaxWage: 595,
                                totalRatings: '631',
                                ratingScore: 5,
                                imageCode: 821,
                                skills: 'Sith Lords Are My Speciality.',
                                name: 'Obi-Wan',
                                cardType: 'Master Jedi Knight',
                              ),
                            ));
                      },
                      isProfileCardChild: PostWidget(
                        isOpen: false,
                        postTitle: 'But who was it who cut Maul in half?',
                        postBody:
                            'And don\'t let me forget. That guy also hacked Vader into a one legged lamp post, and popped that fiendish General Grevious\'s heart like a cherry... As civilized as possible.',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: BrowseListOption(
                      cardType: 'Force Warrior',
                      totalRatings: '231',
                      ratingScore: 5,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Ashoka Tano',
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('view profile'),
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
                                mobsterMaxWage: 295,
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
                      isProfileCardChild: PostWidget(
                        isOpen: false,
                        postTitle:
                            'Yeah. I let Maul get away. But not before I DEFEATED him and CAPTURED him.',
                        postBody:
                            'Don\'t be so quick to forget. I\'m just saying when it comes to props deliver them where they\'re do. Right?',
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: BrowseListOption(
                      cardType: 'Sith Lord',
                      totalRatings: '8.6k',
                      ratingScore: 3,
                      isSearchCard: false,
                      isProfileCard: true,
                      cardTitle: 'Sheev Palpatine',
                      buttonColor: kSexyOrangeButtonColor,
                      labelTextColor: Colors.white,
                      buttonLabel: ('view profile'),
                      isIllegalLineThrough: TextDecoration.none,
                      legallnessIcon: Icons.account_circle,
                      legallnessIconColor: Colors.orange,
                      cardDetail:
                          'You have only began to learn the power of the Dark Side of the Force.',
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
                                    'You have only began to learn the power of the Dark Side of the Force.',
                                name: 'Sheev Palpatine',
                                cardType: 'Sith Lord',
                              ),
                            ));
                      },
                      isProfileCardChild: PostWidget(
                        isOpen: false,
                        postTitle:
                            'Help Wanted. For A Painting. Jedi Help Requested.',
                        postBody:
                            'I have a blank canvas at the Imperial Palace, Jedi please stop by, so that I can paint it with your blood.',
                      ),
                    ),
                  ),
                ),

                ListTile(
                  title: ListTile(
                    title: Container(
                      height: 100.0,
                      child: RawMaterialButton(
                        onPressed: () {
                          // Navigator.pop(context);
                          print('do something on pressed');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostsLandingScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              Text(
                                'next',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                ///TODO remove the duplicates
                ListTile(
                  title: manageBuildingBottomWidgets(),
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

          DynamicBottomBar(chosenButton: Buttons.posts),
        ],
      ),
    );
  }
}
