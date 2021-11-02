import 'package:evl_srvnt1/constants.dart';
import 'package:evl_srvnt1/screens/account_signed_in_screen_boss.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BodyAccountScreenWidget extends StatefulWidget {
  @override
  _BodyAccountScreenWidgetState createState() =>
      _BodyAccountScreenWidgetState();
}

class _BodyAccountScreenWidgetState extends State<BodyAccountScreenWidget> {
  // if sign up is pressed, we want to toggle to the sign up button

  bool isOnLogin = true;

  String stringSignUp = ('sign up');
  String stringLogin = ('login');

  Widget toggleLoginSignUpButtons() {
    if (isOnLogin == true) {
      return LoginButton();
    } else {
      return SignUpButton();
    }
  }

  Widget toggleLoginSignUpString() {
    if (isOnLogin == true) {
      return LoginString();
    } else
      return SignUpString();
  }

  Widget toggleNoAccountText() {
    if (isOnLogin == true) {
      return NoAccountText();
    } else
      return NeedsLoginText();
  }

  Widget toggleSignUpLoginSwitchButton() {
    if (isOnLogin == true) {
      return NoAccountText();
    } else
      return NeedsLoginText();
  }

  String toggleLoginSignupString() {
    if (isOnLogin == true) {
      return stringSignUp;
    } else
      return stringLogin;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 0.0),
        child: ListView(
          children: [
            ListTile(
              title: Container(
                // height: 740.0,
                // height: 520.0,
                color: Colors.black54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage('images/coverArt913.png'),
                      height: 300.0,
                    ),
                    toggleLoginSignUpString(),
                    SizedBox(
                      height: 15.0,
                    ),
                    // LoginButton(),
                    toggleLoginSignUpButtons(),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'or',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontFamily: ('Ovo')),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'images/faceBookIcon.png',
                          width: 50.0,
                        ),
                        // SizedBox(
                        //   width: 10.0,
                        // ),
                        SizedBox(
                          width: 0.0,
                        ),
                        Image.asset(
                          'images/googleIcon.png',
                          width: 50.0,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        toggleNoAccountText(),
                        RawMaterialButton(
                          // fillColor: Colors.pink,
                          onPressed: () {
                            setState(() {
                              isOnLogin = !isOnLogin;
                            });

                            /// do something on pressed
                          },
                          child: Text(
                            toggleLoginSignupString(),
                            style: TextStyle(
                                color: Colors.tealAccent, fontSize: 14.0),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kInactiveCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      onPressed: () {
        // do something onpress3d
        Alert(
            context: context,
            title: "Login".toUpperCase(),
            content: Column(
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'your email',
                    hintStyle: TextStyle(color: Colors.orangeAccent),
                    filled: true,
                    fillColor: kInactiveCardColor,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'your password',
                    hintStyle: TextStyle(color: Colors.orangeAccent),
                    filled: true,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: kInactiveCardColor,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'or login with',
                  style: TextStyle(
                      fontFamily: ('Ovo'), fontSize: 15.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/faceBookIcon.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    // SizedBox(
                    //   width: 10.0,
                    // ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'images/googleIcon.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountSignedInScreenBoss()));
                },
                color: Colors.deepPurple,
                child: Text(
                  "Login".toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Login',
              style: TextStyle(
                fontFamily: ('Cinzel'),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: kInactiveCardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      onPressed: () {
        // do something onpress3d
        Alert(
            context: context,
            title: "SIGN UP".toUpperCase(),
            content: Column(
              children: <Widget>[
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'your email',
                    hintStyle: TextStyle(color: Colors.orangeAccent),
                    filled: true,
                    fillColor: kInactiveCardColor,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                TextField(
                  obscureText: true,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'your password',
                    hintStyle: TextStyle(color: Colors.orangeAccent),
                    filled: true,
                    icon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: kInactiveCardColor,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'or sign up with',
                  style: TextStyle(
                      fontFamily: ('Ovo'), fontSize: 15.0, color: Colors.white),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/faceBookIcon.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                    // SizedBox(
                    //   width: 10.0,
                    // ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Image.asset(
                      'images/googleIcon.png',
                      width: 50.0,
                      height: 50.0,
                    ),
                  ],
                ),
              ],
            ),
            buttons: [
              DialogButton(
                onPressed: () {
                  // Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AccountSignedInScreenBoss()));
                },
                color: Colors.deepPurple,
                child: Text(
                  "SIGN UP",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              )
            ]).show();
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.email_outlined,
              color: Colors.white,
              // size: 25.0,
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              'Sign up',
              style: TextStyle(
                fontFamily: ('Cinzel'),
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                // color: Colors.deepPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// these are the widgets that the function builds on screen
/// when sign up or login button is pressed and thus the blank function is called with set State
/// then a variable changes, and the widgets update accordingly
/// we have 5 functions that return widgets , and 6 classes with build methods returning stateless widgets
/// in addition to the main widget build method
/// this may have not be the most effective method of building this functionality
/// 2 separate stateless widgets and a provider would be able to handle this functionality with a lot less complexity

class LoginString extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'You must login to view your account.',
      textAlign: TextAlign.center,
      style:
          TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: ('Ovo')),
    );
  }
}

class SignUpString extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'You must sign up to use the app.',
      textAlign: TextAlign.center,
      style:
          TextStyle(color: Colors.white, fontSize: 20.0, fontFamily: ('Ovo')),
    );
  }
}

class NoAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'no account?',
      style: TextStyle(color: Colors.white, fontSize: 14.0),
    );
  }
}

class NeedsLoginText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'you have?',
      style: TextStyle(color: Colors.white, fontSize: 14.0),
    );
  }
}
