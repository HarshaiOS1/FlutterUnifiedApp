
import 'package:flutter/material.dart';
import 'package:unifiedflutterapp/ViewModel/SearchViewModel.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchView createState() => _SearchView();
}

class _SearchView extends State<SearchView> {

  final TextEditingController _filter = new TextEditingController();

  Icon _searchIcon = new Icon(Icons.search);
  Widget _appBarTitle = new Text('What are you looking for?',
    style: TextStyle(fontWeight: FontWeight.w100));

  @override
  void initState() {
    // TODO: implement initState
    _filter.addListener((){
      searchFieldListner();
    });
    super.initState();
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appBarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
              prefixIcon: new Icon(Icons.search),
              hintText: 'Search...',
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appBarTitle = _appBarTitle;
        _filter.clear();
      }
    });
  }

  //TextField Listener
  void searchFieldListner() {
    if (_filter.text.length > 3){
//      print(_filter.text);
//      var result = SearchViewModel().getSearchResult(_filter.text);
//      ListViewClass().getSearchResult(_filter.text);
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _filter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: true,
      title: _appBarTitle,
      backgroundColor: Colors.grey,
      actions: <Widget>[
        IconButton(
          icon: _searchIcon,
          onPressed: (){
            _searchPressed();
          },
        )
      ],
    ),
    body: SafeArea(
        child: ListViewClass().build(context)
        ),
      );
    }
  }

// ignore: must_be_immutable
class ListViewClass extends StatelessWidget {
  String searchStr = "India";
  GoogleResponse apiResponse;

//  ListViewClass().addListener(_listener);

  void _listener() {
    print('Model changed!');
  }

  void getSearchResult(String searchString) {
//    apiResponse = await SearchViewModel().getSearchResult(searchString);
//    print(apiResponse);
    searchStr = searchString;

  }

  ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: (data as GoogleResponse).items.length,
        itemBuilder: (context, index) {
          return _tile((data as GoogleResponse).items[index].title, index);
        });
  }

//  ListTile _tile(String title, IconData image) => ListTile(
  ListTile _tile(String title, int index) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          backgroundColor: Colors.black12
        )),
//    subtitle: Text(subtitle),
//    leading: Icon(
//      icon,
//      color: Colors.blue[500],
//    ),
  );

  @override
  Widget build(BuildContext context) {
    if (searchStr != null) {
     return FutureBuilder<GoogleResponse>(
        future: SearchViewModel().getSearchResult(searchStr),
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