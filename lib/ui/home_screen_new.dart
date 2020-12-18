import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:software_technology/provider/provider.dart';
import 'package:software_technology/ui/widgets/popular_topics.dart';
import 'package:software_technology/ui/widgets/posts.dart';
import 'package:software_technology/ui/widgets/top_bar.dart';
import 'package:software_technology/ui/widgets/topics_widget.dart';
import 'package:themify_flutter/themify_flutter.dart';

import 'login/Widget/tabBar_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  
  List<Widget> list = [];

  TabController _controller;
  int _selectedIndex = 0;
  TopicsWidget topicsWidget;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    topicsWidget = TopicsWidget(
        listOfTopics:
            Provider.of<AppProvider>(context, listen: false).allTopicsList);
    list = topicsWidget.convertListOfTopicsToListOfTextWidgets();

    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        Provider.of<AppProvider>(context).allTopicsList = [];
        _selectedIndex = _controller.index;
        
      });
      print("Selected Index: " + _controller.index.toString());
    });
    
    Provider.of<AppProvider>(context, listen: false).getAllEntryWithDetails();
    Provider.of<AppProvider>(context, listen: false).getAllTags();
    }

  List<Widget> tabBarChildrenWidgetList = [];
  setupTabBarWidgetChildrenList() {
    for (int i = 0; i < list.length; i++) {
      tabBarChildrenWidgetList.add(TabBarViewChild(
        topic: Provider.of<AppProvider>(context).allTopicsList[i],
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    Posts post =     Posts(topicsWidget.listOfTopics[_selectedIndex]);
    setupTabBarWidgetChildrenList();
    return Scaffold(
      appBar: PreferredSize(
              preferredSize: Size(double.infinity , 150),
              child: AppBar(

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          automaticallyImplyLeading: false,
          actions: [
            
            GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/profile-two-page');
                },
                child: CircleAvatar(
                    child: Icon(
                  Icons.person,
                ))),
          ],
          bottom: TabBar(

            indicator: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                color: Colors.black45),
            //labelColor: Colors.white,
            labelStyle: TextStyle(
                fontSize: 15,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),

            isScrollable: true,
            
            onTap: (index) {
              
              setState(() {

                _selectedIndex = _controller.index;
                post = Posts(topicsWidget.listOfTopics[_selectedIndex]);
                print(_selectedIndex.toString() + '_selectedIndex');
              });
              
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
            labelPadding: EdgeInsets.all(10),
            
          ),
          title: Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                  text: 'L',
                  style: GoogleFonts.portLligatSans(
                    textStyle: Theme.of(context).textTheme.display1,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: 'exi',
                      style: TextStyle(color: Colors.black, fontSize: 30),
                    ),
                    TextSpan(
                      text: ' Go',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ]),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: ListView(
        children: <Widget>[
          Container(
            
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                            child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Find Topics you like to read",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14.0,
                          ),
                        ),
                        Icon(
                          Themify.search,
                          size: 20,
                          color: Colors.white,
                        )
                      ],
                    ),
            ),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35.0),
                      topRight: Radius.circular(35.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Popular Topics",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  PopularTopics(),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
                    child: Text(
                      "Trending Posts",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  post
                ],
              ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
  backgroundColor: const Color(0xff03dac6),
  foregroundColor: Colors.black,
  mini: true,
  onPressed: () {

    Navigator.of(context).pushNamed('/Posting');
    // Respond to button press
  },
  child: Icon(Icons.add),
),
    );
  }
}
