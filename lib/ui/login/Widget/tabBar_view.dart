import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_technology/models/entry.dart';
import 'package:software_technology/models/topic.dart';
import 'package:software_technology/provider/provider.dart';

class TabBarViewChild extends StatefulWidget {
  Topic topic;
  TabBarViewChild({Key key, this.topic}) : super(key: key);

  @override
  _TabBarViewChildState createState() => _TabBarViewChildState();
}

class _TabBarViewChildState extends State<TabBarViewChild> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<AppProvider>(context, listen: false)
          .getAllEntriesByTopicId(widget.topic),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {

          List<Entry> entriesByTopicId = snapshot.data;
          return ListView.builder(
            
            itemCount: entriesByTopicId.length,
            itemBuilder: (context, index) {
            return ListTile(
              title: Text(entriesByTopicId[index].value),
              trailing: Text(entriesByTopicId[index].id.toString()),
            );
          });
        }else{
          return CircularProgressIndicator();
        }
      },
    );
  }
}
