import 'package:evl_srvnt1/screens/mobster_profile_screen.dart';
import 'package:evl_srvnt1/screens/view_post_screen.dart';
import 'package:evl_srvnt1/screens/write_comment_screen.dart';
import 'package:evl_srvnt1/widgets/gradient_text.dart';
import 'package:evl_srvnt1/widgets/reusable_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class PostWidget extends StatefulWidget {
  final String postTitle;
  final String postBody;
  final bool isOpen;

  PostWidget(
      {required this.postTitle, required this.postBody, required this.isOpen});

  @override
  _PostWidgetState createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  bool openComments = false;

  Widget toggleCommentOpenness() {
    if (openComments == false) {
      return Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  /// implement ontap
                  setState(() {
                    openComments = !openComments;
                  });
                },
                child: Text(
                  'see comments',
                  style: TextStyle(color: Colors.orangeAccent),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
        ],
      );
    } else {
      return Container(
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    ///TODO implement ontap
                    setState(() {
                      openComments = !openComments;
                    });
                  },

                  ///TODO replace this widget below with the custom function that returns the comments or the button
                  child: Text(
                    'close comments',
                    style: TextStyle(color: Colors.orangeAccent),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50),
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
                  postTitle:
                      'Luke was just a selfish little brat when I started training him.',
                  postBody:
                      'But we all know that he turned out alright-ish. Looks like my track record ain\'t that bad after all.',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50),
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
                    'I\'ve got two lightsabers, one for the each of you.',
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
                  postTitle: 'Thinks Of A Good Post Title Ashoka Does Not',
                  postBody:
                      'Then she just straight up goes off about not just the sith and the people who follow them but also about the separatists. Like girl, how long ago? Are you really going to go there?',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50),
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
                    'You have only began to master the power of the Dark Side of the Force.',
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
                              'You have only began to master the power of the Dark Side of the Force.',
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
            Container(
              height: 100.0,
              child: RawMaterialButton(
                onPressed: () {
                  setState(() {
                    openComments = !openComments;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      Text(
                        'close comments',
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.white70,
          // height: 200.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GradientText(widget.postTitle,
                  style: TextStyle(
                      color: Colors.orangeAccent,
                      fontFamily: ('Ovo'),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                  gradient: LinearGradient(colors: [
                    Colors.deepOrangeAccent,
                    Colors.orangeAccent,
                  ])),
              // Text(
              //   widget.postTitle,
              //   // 'Writes A Post Title Ashoka Does',
              //   style: TextStyle(
              //       color: Colors.orangeAccent,
              //       fontFamily: ('Ovo'),
              //       fontSize: 22.0,
              //       fontWeight: FontWeight.bold),
              // ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                widget.postBody,
                // 'Then she just straight up goes off about not just the sith and the people who follow them but also about the separatists. Like girl, how long ago? Are you really going to go there?',
                style: TextStyle(
                    color: Colors.white, fontFamily: ('Ovo'), fontSize: 17.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: widget.isOpen == false

                        ///  show this child if the post is not opened
                        /// else show a different child like the rest of the post body.
                        ? GestureDetector(
                            onTap: () {
                              // launch the full post view
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPostScreen()));
                            },
                            child: Text(
                              'view full post',
                              style: TextStyle(color: Colors.orangeAccent),
                            ),
                          )
                        : Text(
                            'The rest of the post can be right here right? And just for the sake of doing it I think that should be a half decent sized amount of content in here for the sample post.',
                            style: TextStyle(
                                fontSize: 17.0,
                                fontFamily: ('Ovo'),
                                color: Colors.white),
                          ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    openComments = !openComments;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WriteCommentScreen()));
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '254',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontFamily: ('Ovo')),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Icon(
                          FontAwesomeIcons.reply,
                          color: Colors.white,
                          size: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '37k',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          fontFamily: ('Ovo')),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      FontAwesomeIcons.solidThumbsUp,
                      color: Colors.white,
                      size: 20.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            widget.isOpen == true ? toggleCommentOpenness() : Container(),
          ],
        ),

        // Padding(
        //   padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        //   child: RawMaterialButton(
        //     shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(15.0)),
        //     onPressed: () {
        //       // print do something
        //     },
        //     fillColor: Colors.deepPurpleAccent,
        //     child: Padding(
        //       padding: const EdgeInsets.all(13.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           Icon(
        //             Icons.anchor,
        //             color: Colors.white,
        //             size: 20.0,
        //           ),
        //           Text(
        //             'hello'.toUpperCase(),
        //             style: TextStyle(
        //                 color: Colors.white,
        //                 decoration: TextDecoration.none,
        //                 decorationColor: Colors.white24,
        //                 fontSize: 13.0,
        //                 decorationThickness: 5.0),
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
