import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {

  static void routeTransition(BuildContext context,
      StatelessWidget statelessWidget) {
    Navigator.of(context).push(
        CupertinoPageRoute<Null>(builder: (BuildContext context) {
          return statelessWidget;
        }));
  }

  static void routeTransitionStateFull(BuildContext context,
      StatefulWidget statefulWidget) {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute<Null>(builder: (BuildContext context) {
          return statefulWidget;
        }), ModalRoute.withName("/login"));
  }

  static void pushViewController(BuildContext context, StatefulWidget statefulWidget) {
    Navigator.of(context).push(
      CupertinoPageRoute<Null>(builder: (BuildContext context){
        return statefulWidget;
      }));
  }

  static void showAlertMessage(BuildContext context, String alertHeading,
      String alertMessage, String rightButtonText, String leftButtonText) { //AlertListener alertListener) {

    // Buttons Setup
    Widget cancelButton = FlatButton(
      child: Text(leftButtonText),
      onPressed:  () {
//        leftButtonAction()
      },
    );
    Widget continueButton = FlatButton(
      child: Text(rightButtonText),
      onPressed:  () {
//        rightButtonAction();
        Navigator.of(context).pop(false);
//        alertListener.onRightButtonAction();
      },
    );

    //Alert SetUp
    AlertDialog alert = AlertDialog(
      elevation: 10.0,
      title: Text(alertHeading),
      content: Text(alertMessage),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // Alert Display
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}