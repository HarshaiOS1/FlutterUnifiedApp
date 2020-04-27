
import 'package:flutter/material.dart';
import 'package:unifiedflutterapp/ViewModel/SearchViewModel.dart';
import 'package:unifiedflutterapp/Widgets/ListViewClass.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchView createState() => _SearchView();
}

class _SearchView extends State<SearchView> {

  final TextEditingController _filter = new TextEditingController();
  var didTextChange = false;
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
      setState(() {
        didTextChange = true;
    });
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
    body: didTextChange ? ListViewClass(_filter.text) : CircularProgressIndicator(),

//    SafeArea(
//        child: ListViewClass().build(context),
//          ),
        );
    }
  }