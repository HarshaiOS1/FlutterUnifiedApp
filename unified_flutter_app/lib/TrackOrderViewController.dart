import 'package:flutter/material.dart';

class TrackOrder extends StatefulWidget {

  @override
  _TrackOrder createState() => new _TrackOrder();
}

class _TrackOrder extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Text(
              "Track order Page ",
            )
        ));
  }
}