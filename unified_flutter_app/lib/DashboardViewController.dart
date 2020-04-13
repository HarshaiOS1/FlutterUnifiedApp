import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:unifiedflutterapp/HomePageViewController.dart';
import 'package:unifiedflutterapp/HelpViewController.dart';
import 'package:unifiedflutterapp/LoginViewController.dart';
import 'package:unifiedflutterapp/SearchViewController.dart';
import 'package:unifiedflutterapp/ShopListViewController.dart';
import 'package:unifiedflutterapp/TrackOrderViewController.dart';
import 'package:unifiedflutterapp/Utils.dart';

class DashboardScreen extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Home", Icons.home),
    new DrawerItem("Shops", Icons.shop),
    new DrawerItem("Track Order", Icons.track_changes),
    new DrawerItem("Search", Icons.search),
    new DrawerItem("Help", Icons.help)
  ];

  @override
  _DashboardScreen createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
//      Navigate to respective Screens
      case 0:
        return new HomePage();
      case 1:
        return new ShopList();
      case 2:
        return new TrackOrder();
      case 3:
        return new SearchView();
      case 4:
        return new HelpView();
      default:
//        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOptions = [];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(new ListTile(
        leading: new Icon(d.icon),
        title: new Text(d.title),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }
    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Oadfadsf"),
                accountEmail: null),

            new Column(children: drawerOptions),
            new Material(
              color: Colors.transparent,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                      LoginScreen()), (Route<dynamic> route) => false);
                },
                child: Text(
                  "Log Out",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                  color: Colors.red[200]),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}


