import 'package:flutter/material.dart';
import 'package:unifiedflutterapp/ViewModel/SearchViewModel.dart';
import 'package:unifiedflutterapp/GenericWebViewContoller.dart';

// ignore: must_be_immutable
class ListViewClass extends StatelessWidget {

  final String searchString;
  ListViewClass(this.searchString);
  GoogleResponse apiResponse;

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: (data as GoogleResponse).items.length,
        itemBuilder: (context, index) {
          return _tile((data as GoogleResponse).items[index].title,
              index);
        });
  }

//  ListTile _tile(String title, IconData image) => ListTile(
  ListTile _tile(String title, int index) => ListTile(

    title: Text(title,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
            backgroundColor: (index % 2 == 0) ? Colors.black12 : Colors.black45
        )),
//    subtitle: Text(subtitle),
//    leading: Icon(
//      icon,
//      color: Colors.blue[500],
//    ),
//    selected: WebViewContainer("https://www.embitel.com/company/contact-us"),
  );

  @override
  Widget build(BuildContext context) {
    print(searchString);
    if (searchString != null) {
      return FutureBuilder<GoogleResponse>(
        future: SearchViewModel().getSearchResult(searchString),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return _jobsListView(snapshot.data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      );
    }
    return CircularProgressIndicator();
  }
}