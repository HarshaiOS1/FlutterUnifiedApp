import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Row(
            children: <Widget>[
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: GridView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index){
                     return  GridTile(
                       child: Text("Test GRID",
                           style: TextStyle(
                               fontWeight: FontWeight.w500,
                               fontSize: 20,
                               backgroundColor: (index % 2 == 0) ? Colors.black12 : Colors.black45
                           )
                       ),
                     );
                    }
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}