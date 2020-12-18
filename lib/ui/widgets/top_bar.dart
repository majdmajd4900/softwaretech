import 'package:flutter/material.dart';

class TopBar extends StatefulWidget {
  List<Widget> list;
  TabController controller;
  TopBar({this.list , this.controller});
  @override
  _TopBarState createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
   List<Widget> contents = [];
  int _selectedIndex = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    contents = widget.list;
    return
    AppBar(
      actions: [
  GestureDetector(
    onTap: (){
      Navigator.of(context).pushNamed('/profile-two-page');
    },
    child: CircleAvatar(child: Icon(Icons.person,))),
      ],
          bottom: TabBar(
            isScrollable: true,
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: widget.controller,
            tabs: contents,
          ),
          title: Text('LexiGo'),
        );
  }
}