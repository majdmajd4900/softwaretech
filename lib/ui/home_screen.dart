import 'package:flutter/material.dart';
import 'package:software_technology/ui/widgets/home_page_%20listview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Text('#topic'),
    Text('#topic'),
    Text('#topic'),
    Text('#topic'),
    Text('#topic'),

  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
    AppBar(
      actions: [
  GestureDetector(
    onTap: (){
      Navigator.of(context).pushNamed('/profile-two-page');
    },
    child: CircleAvatar(child: Icon(Icons.person,))),
      ],
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('LexiGo'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ListView.builder(itemBuilder: (context ,index){
              return ListTile(title: Text('topic proble 1 main idea'),trailing: Text('15'),);
            }),
            Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
                Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
                Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
                Center(
                child: Text(
                  _selectedIndex.toString(),
                  style: TextStyle(fontSize: 40),
                )),
          ],
        ),

        bottomNavigationBar:BottomNavigationBar(
       currentIndex: 2, // this will be set when a new tab is tapped
       items: [
         
         BottomNavigationBarItem(
           icon: new Icon(Icons.search,color: Colors.black),
           label: 'Search',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person,color: Colors.black),
           label: 'Profile'
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.home ,color: Colors.black,),
           label: 'Home',
         ),

         BottomNavigationBarItem(
           icon: Icon(Icons.notifications,color: Colors.black),
           label: 'Notifications'
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.message,color: Colors.black),
           label: 'Message'
         )
       ],
     ),
    );
  }
}
