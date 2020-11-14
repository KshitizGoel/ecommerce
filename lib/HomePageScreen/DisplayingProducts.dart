//We will implement a search bar here.
import 'package:ecommerce/Widgets/CustomText.dart';
import 'package:ecommerce/Widgets/_CustomText.dart';
import 'package:flutter/material.dart';

class DisplayingProducts extends StatefulWidget{
  DisplayingProducts({ Key key }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
   return DisplayingProductsState();
  }

}

class DisplayingProductsState extends State<DisplayingProducts>{
  Widget appBarTitle =  CustomText("Search Products", 20 , 20);
  Icon actionIcon = new Icon(Icons.search, color: Colors.white,);
  final key = new GlobalKey<ScaffoldState>();

  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _IsSearching;
  String _searchText = "";

  DisplayingProductsState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _IsSearching = false;
          _searchText = "";
        });
      }
      else {
        setState(() {
          _IsSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();

  }

  //We will run a query from the Firebase.

  void init() {
    _list = List();
    _list.add("Apparels");
    _list.add("Clothes");
    _list.add("Shoes");
    _list.add("Sports");
    _list.add("Athlete");
    _list.add("Gaming");
    _list.add("Play Station");
    _list.add("Toys");
    _list.add("Cricket");
    _list.add("T Shirts");
    _list.add("Ethnic");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _IsSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return _list.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return _list.map((contact) => new ChildItem(contact))
          .toList();
    }
    else {
      List<String> _searchList = List();
      for (int i = 0; i < _list.length; i++) {
        String  name = _list.elementAt(i);
        if (name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(name);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact))
          .toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: appBarTitle,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(500),
          ),
        ),
        actions: <Widget>[
          new IconButton(icon: actionIcon, onPressed: () {
            setState(() {
              if (this.actionIcon.icon == Icons.search) {
                this.actionIcon = new Icon(Icons.close, color: Colors.white,);
                this.appBarTitle = new TextField(
                  controller: _searchQuery,
                  style: new TextStyle(
                    color: Colors.white,

                  ),
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(Icons.search, color: Colors.white),
                      hintText: "Search...",
                      hintStyle: new TextStyle(color: Colors.white)
                  ),
                );
                _handleSearchStart();
              }
              else {
                _handleSearchEnd();
              }
            });
          },),
        ]
    );
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(Icons.search, color: Colors.white,);
      this.appBarTitle =
      new Text("Search Sample", style: new TextStyle(color: Colors.white),);
      _IsSearching = false;
      _searchQuery.clear();
    });
  }


}
class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return new ListTile(title: new Text(this.name));
  }

}