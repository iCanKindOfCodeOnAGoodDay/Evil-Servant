import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'alert_button_widget.dart';
import 'package:evl_srvnt1/constants.dart';

class QuestionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: Container(
        color: kInactiveCardColor,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Questions?',
                // style: kReusableDetailCardTitle,
                style: TextStyle(
                    color: Colors.white,
                    // color: Colors.orangeAccent,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: ('Cinzel')),
              ),
              // SizedBox(
              //   height: 10.0,
              // ),
              SizedBox(
                height: 5.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outlined,
                    size: 20.0,
                    color: Colors.deepPurple,
                  ),
                  AlertButton(
                      popUpTitle: 'How it works',
                      buttonTitle: 'How it Works',
                      description: ' '
                      // 'Individual contractors sign up to become Mobsters on the app. They build out their profiles, which then become available to people searching for those services in that area. The Mobsters hustle hard to earn reviews so that they can build street credits and continue to be making maximum wage on the MOBaP.',
                      ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outlined,
                    size: 20.0,
                    color: Colors.deepPurple,
                  ),
                  AlertButton(
                    popUpTitle: 'About the act',
                    buttonTitle: 'About the act',
                    description: ' ',
                    // 'Each Act begins with a message to a few of the available mobsters. Once you have made contact the Mobsters will be getting back to you soon. Both parties agree on the Act, then proceed to carrying it out. But, first  payment is made to the MOBaP, who then pays your mobster \$150 hour.',
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outlined,
                    size: 20.0,
                    color: Colors.deepPurple,
                  ),
                  AlertButton(
                    popUpTitle: 'Our disclaimer',
                    buttonTitle: 'Our disclaimer',
                    description: ' ',
                    // 'The illegal services are not real. They are simply shown on screen as part of the mobster theme. We do not endorse any illegal activities.',
                  ),
                ],
              ),
              SizedBox(
                height: 5.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.check_circle_outlined,
                    size: 20.0,
                    color: Colors.deepPurple,
                  ),
                  AlertButton(
                      popUpTitle: 'Customer support',
                      description: ' ',
                      // 'This app does not have a backend, so there is no need for customer support. The Developer can be contacted at scottquashen.sq@gmail.com',
                      buttonTitle: 'Customer support')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
