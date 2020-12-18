import 'package:flutter/material.dart';
import 'package:software_technology/models/topic.dart';

class TopicsWidget{

  List<Topic> listOfTopics=[];
  List<Widget> topicsAsWidgetList=[];
  TopicsWidget({this.listOfTopics , this.selectedIndex ,this.index }  );
  int selectedIndex = 0;
  int index ; 

  convertListOfTopicsToListOfTextWidgets(){

    for(int x = 0 ; x<listOfTopics.length; x++){

      topicsAsWidgetList.add(Text(listOfTopics[x].value  ),);



    }

return topicsAsWidgetList;

  }


}