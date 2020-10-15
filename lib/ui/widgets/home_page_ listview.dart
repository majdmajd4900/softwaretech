import 'dart:ui';

import 'package:flutter/material.dart';

class HomePageListview extends StatefulWidget {
  Color backgroundColorOfMainField;
  String mainName;
  List<String> listviewContents =[];
  IconData icon;
  Color backgroundColorOfListItem;
  LinearGradient colorGradientOfItem;
  HomePageListview({Key key , this.backgroundColorOfMainField , this.mainName , this.listviewContents , this.icon , this.backgroundColorOfListItem ,this.colorGradientOfItem}) : super(key: key);

  @override
  _HomePageListviewState createState() => _HomePageListviewState();
}

class _HomePageListviewState extends State<HomePageListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
       height: MediaQuery.of(context).size.height/3,
       color: widget.backgroundColorOfMainField,
       child: Stack(
         children: [
           Positioned(
             left: 8,
             top: 5,
             child: Icon(widget.icon),),
           
           Positioned(
             left: 30,
             top: 8,
             child: Text(widget.mainName)),
           Positioned(
             top: 15,
             left: 8,
                        child: ListView.builder(
               scrollDirection: Axis.horizontal ,
               itemCount: widget.listviewContents.length ,
               itemBuilder: (context , index){
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     width: MediaQuery.of(context).size.width/3,

                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(20) , 
                       color: widget.backgroundColorOfListItem ,
                       gradient: widget.colorGradientOfItem
                       
                       ),
                     child: Column(
                       children:[
                        Text(widget.listviewContents[index],),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('some description some description some description'),
                        ),
                        Text('Click to read'),

                       ]
                     ),
                   ),
                 );
               }),
           )
         ],
       ),

    );
  }
}