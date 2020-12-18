import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_technology/models/tag.dart';
import 'package:software_technology/provider/provider.dart';

class PopularTopics extends StatefulWidget {
  @override
  _PopularTopicsState createState() => _PopularTopicsState();
}

class _PopularTopicsState extends State<PopularTopics> {
  List<String> contents = [
    "C##" , "Laravel" ,"Node Js", "Nginx"
  ];

List<Tag> allTags ;
@override
void initState() { 
  super.initState();
  allTags  = Provider.of<AppProvider>(context,listen: false).listOfAllTags;
  
}
  convertTagsToString(context , ){
    
    List<String> contents = [];
      
print('I am here ');

    for(int i = 0 ; i<allTags.length;i++){
      
      contents.add(allTags[i].value);
    }

    this.contents = contents;
  }

  List<Color> colors  = [
    Colors.purple, Colors.blueAccent, Colors.greenAccent, Colors.redAccent
  ];

  @override
  Widget build(BuildContext context) {
    convertTagsToString(context );
    print('qwertyuiop');
    return Container(
      height: 170,  
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: contents.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(left: 20.0),
            height: 180,
            width: 170,
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(24.0), 
            ),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    contents[index],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "30 posts",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      letterSpacing: .7
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}