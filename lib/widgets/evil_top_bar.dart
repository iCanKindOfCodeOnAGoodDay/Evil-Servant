import 'package:evl_srvnt1/widgets/gradient_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EvilTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          // child: Text('EviL SRVNT',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'evil'.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: ('Ovo'),
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // Text(
              //   'ster'.toUpperCase(),
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontFamily: ('Ovo'),
              //     fontSize: 15.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 0.0),
                child: GradientText(
                  'Servant',
                  gradient: LinearGradient(
                      colors: [Colors.deepOrangeAccent, Colors.orangeAccent]),
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: ('Cinzel'),
                  ),
                ),
                //     Text(
                //   'Servant',
                //   style: TextStyle(
                //     color: Colors.orangeAccent,
                //     fontSize: 60.0,
                //     // fontWeight: FontWeight.bold,
                //     // fontFamily: ('Cinzel'),
                //   ),
                // ),
              ),
              // Text(
              //   'MOBaP',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontSize: 70.0,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Text(
              // 'Signed NDA between each client (boss) and each Evil Servant help so that the Evil Servants can accomplish their mission: to satisfy your evil needs and desires while on the Evil Act.',
              // 'To act evil together is our destiny'.toUpperCase(),
              'Welcome to the jungle'.toUpperCase(),
              // textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: ('Ovo'))),
        ),

        ///TODO Begin the center screen Listview here
        ///So the below padding widget needs to be removed from this Column
      ],
    );
  }
}
