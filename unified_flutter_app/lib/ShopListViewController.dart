import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShopList extends StatefulWidget {

  @override
  _ShopList createState() => new _ShopList();

}

class _ShopList extends State<ShopList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: _getHeaderList()
        ));
  }

  _headerPressed(){
    setState(() {

    });
  }
}

  Widget _getHeaderList() {
    var listArray = ["Harsha", "Suresh", "Anzer", "Ravindra"];
    var harshaList = ["Jonny Walker","100 Pipers","Red Label"];
    var anzerList = ["BigBear","KFC Strong","Budwiser","Beera"];
    var isHarshaSelected = false;
    var isAnzerSelected = false;

//    _headerPressed(){
//      setState(() {
//
//      });
//    }


    return SizedBox(
      height: 450,
      child: ListView.builder(
          itemCount: listArray.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  OutlineButton(
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                    color: Colors.red,
                      child: Center(
                        child: Text(
                          listArray[index],
                        ),
                    ),
                    onPressed: () {
                      if (index ==  0) {
                        isHarshaSelected = true;
                        isAnzerSelected = false;
                      } else if (index == 2) {
                        isHarshaSelected = false;
                        isAnzerSelected = true;
                      }
                    },
                    ),
                    Container(
                      child: (isHarshaSelected || isAnzerSelected) ? ListView.builder(
                          itemCount: isHarshaSelected ? harshaList.length : anzerList.length,
                          itemBuilder: (context, index) {
                           return Container(
                             child: Text(
                                 isHarshaSelected ? harshaList[index] : anzerList[index]
                             ),
                           );
                          })
                          : null
                    ),
                ],
              ),
            );
          }),
    );
  }