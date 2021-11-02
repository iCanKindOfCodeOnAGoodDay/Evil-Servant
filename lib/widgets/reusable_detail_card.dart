/// this is the custom container widget for each list option
/// used 7 times currently on the browse landing screen

import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class BrowseListOption extends StatelessWidget {
  final Color buttonColor;
  final String buttonLabel;
  final Color labelTextColor;
  final TextDecoration isIllegalLineThrough;
  final IconData legallnessIcon;
  final Color legallnessIconColor;
  final String cardDetail;
  final String cardTitle;
  final Widget isProfileCardChild;
  final bool isProfileCard;
  final bool isSearchCard;

  final bool isAvailable;
  // final bool isServant;

  /// add in button navigation to each details screen widget
  ///

  final VoidCallback onButtonTap;

  final int cardArtCode;

  /// this is the code that allows us to change images
  /// by altering the string in the file name for each image
  ///
  //

  final String totalRatings;
  final int ratingScore;

  final String cardType;

  BrowseListOption({
    required this.buttonColor,
    required this.buttonLabel,
    required this.labelTextColor,
    required this.isIllegalLineThrough,
    required this.legallnessIcon,
    required this.legallnessIconColor,
    required this.cardDetail,
    required this.isAvailable,
    required this.cardArtCode,
    required this.onButtonTap,
    required this.cardTitle,
    required this.isProfileCardChild,
    required this.isProfileCard,
    required this.isSearchCard,
    required this.totalRatings,
    required this.ratingScore,
    required this.cardType,
  });

  /// TODO write a function that changes the color of the first star

  Color firstStar() {
    if (ratingScore >= 1) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

  Color secondStar() {
    if (ratingScore >= 2) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

  Color thirdStar() {
    if (ratingScore >= 3) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

  Color fourthStar() {
    if (ratingScore >= 4) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

  Color fifthStar() {
    if (ratingScore >= 5) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }

  // Widget buildCTAButton() {
  //   if (isSearchCard == true) {
  //     return Padding(
  //       padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
  //       child: TextField(
  //         obscureText: false,
  //         style: TextStyle(color: Colors.white),
  //         decoration: InputDecoration(
  //           border: OutlineInputBorder(),
  //           hintText: 'search term',
  //           hintStyle: TextStyle(color: Colors.orangeAccent),
  //           filled: true,
  //           icon: Icon(
  //             Icons.search,
  //             color: Colors.white,
  //           ),
  //           labelText: 'type',
  //           labelStyle: TextStyle(color: Colors.white),
  //           fillColor: Colors.white12,
  //         ),
  //       ),
  //     );
  //   } else {
  //     return Padding(
  //       padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
  //       child: RawMaterialButton(
  //         onPressed: onButtonTap,
  //         fillColor: buttonColor,
  //         child: Padding(
  //           padding: const EdgeInsets.all(8.0),
  //           child: Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               Icon(
  //                 legallnessIcon,
  //                 color: legallnessIconColor,
  //                 size: 20.0,
  //               ),
  //               Text(
  //                 buttonLabel.toUpperCase(),
  //                 style: TextStyle(
  //                     color: labelTextColor,
  //                     decoration: isIllegalLineThrough,
  //                     decorationColor: Colors.white24,
  //                     fontSize: 13.0,
  //                     decorationThickness: 5.0),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     );
  //   }
  // }

  Widget BuildRatingsWidget() {
    if (isAvailable == true) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              /// TODO update the color programatically depedning on the star rating
              /// each star gets a function that determines it's color, black or orange
              Icon(
                Icons.star,
                color: firstStar(),
              ),
              Icon(
                Icons.star,
                color: secondStar(),
              ),
              Icon(
                Icons.star,
                color: thirdStar(),
              ),
              Icon(
                Icons.star,
                color: fourthStar(),
              ),
              Icon(
                Icons.star,
                color: fifthStar(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Based on $totalRatings Ratings',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 8.0,
                        fontFamily: ('Ovo'))),
              ],
            ),
          ),
        ],
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 10.0, left: 0.0, right: 0.0, bottom: 10.0),
        child:
            // if
            Container(
          /// this is the container for each 'card'
          // color: Colors.white,
          // color: isSearchCard == true ? Colors.deepPurpleAccent : Colors.black,

          /// use the Ternary Operator to change custom widget sized based on isProfileCard;
          height: isProfileCard == true ? null : null,

          ///the containers child was previously
          ///just a single column
          ///now, we will add to the column
          ///there will be two children
          ///one a row, and two the full width button
          ///the Row will contain two columns, 1. the description column, and 2. and image for each of the buttons.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(cardTitle,
                            style: TextStyle(
                              color: Colors.orangeAccent,
                              // isAvailable == false
                              //     ? Colors.orangeAccent
                              //     : Colors.orangeAccent,
                              fontFamily: ('FiraSansExtraCondensed'),
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                            gradient: LinearGradient(colors: [
                              Colors.deepOrangeAccent,
                              Colors.orangeAccent,
                            ])),
                        // Text(
                        //   cardTitle,
                        //   style: TextStyle(
                        //     color: Colors.orangeAccent,
                        //     // isAvailable == false
                        //     //     ? Colors.orangeAccent
                        //     //     : Colors.orangeAccent,
                        //     fontFamily: ('FiraSansExtraCondensed'),
                        //     fontWeight: FontWeight.bold,
                        //     fontSize: 20.0,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                          ),
                          child: Text(
                            cardDetail,
                            // softWrap: true,
                            style: TextStyle(
                                // color: Colors.white,
                                color: kSexyOffWhite,
                                fontFamily: ('Ovo'),
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: BuildRatingsWidget(),
                        ),

                        /// put a sized box for now in between the title and the action button of each box
                        SizedBox(
                          height: 30.0,
                        ),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: Row(
                            children: [
                              Text(
                                cardType,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: ('BebasNeue'),
                                    fontSize: 15.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///right side of row is here

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            /// change the image String based on isActive bool which is already declared
                            /// right now all the images are the same because we always
                            /// pass in the same code when each stateless widget is initialized
                            'images/coverArt$cardArtCode.png',
                            width: 130.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: isProfileCardChild,
              ),

              /// TODO put CTA button here
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: RawMaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  onPressed: onButtonTap,
                  fillColor: buttonColor,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          legallnessIcon,
                          color: legallnessIconColor,
                          size: 20.0,
                        ),
                        Text(
                          buttonLabel.toUpperCase(),
                          style: TextStyle(
                              // color: labelTextColor,
                              color: kSexyOffWhite,
                              decoration: isIllegalLineThrough,
                              decorationColor: Colors.white24,
                              fontSize: 13.0,
                              decorationThickness: 5.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
        //        != null) {
        //
        // },
        );
  }
}
