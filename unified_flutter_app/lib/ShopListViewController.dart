import 'package:flutter/material.dart';

class ShopList extends StatefulWidget {

  @override
  _ShopList createState() => new _ShopList();
}

class _ShopList extends State<ShopList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Text(
              "SHOP list Page ",
            )
        ));
  }
}