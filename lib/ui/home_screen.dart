import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_technology/provider/provider.dart';
import 'package:software_technology/ui/widgets/topics_widget.dart';

import 'login/Widget/tabBar_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      TopicsWidget topicsWidget = TopicsWidget(listOfTopics: Provider.of<AppProvider>(context,listen: false).allTopicsList);
    list = topicsWidget.convertListOfTopicsToListOfTextWidgets();
    
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        Provider.of<AppProvider>(context ).allTopicsList=[];
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }




List<Widget> tabBarChildrenWidgetList=[];
setupTabBarWidgetChildrenList(){
for(int i = 0 ; i<list.length;i++){

tabBarChildrenWidgetList.add(TabBarViewChild(topic: Provider.of<AppProvider>(context).allTopicsList[i],));
      


    }

}
  @override
  Widget build(BuildContext context) {
    setupTabBarWidgetChildrenList();
    
 
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
            isScrollable: true,
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
          
          children: tabBarChildrenWidgetList
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
