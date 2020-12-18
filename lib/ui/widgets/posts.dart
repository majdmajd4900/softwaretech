import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:software_technology/models/entry.dart';
import 'package:software_technology/models/entry_detailed_model.dart';
import 'package:software_technology/models/post_model.dart';
import 'package:software_technology/models/topic.dart';
import 'package:software_technology/provider/provider.dart';
import 'package:software_technology/ui/post_screen.dart';
import 'package:themify_flutter/themify_flutter.dart';

class Posts extends StatefulWidget {
  Topic topic;
  Posts(this.topic);
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {

  List<Question> questions2 = [];

 List<Question> convertEntryToAQuestions(List<EntryDetaild> entry){
    List<Question> questions = [];
    for(int i = 0 ;i<entry.length;i++ ){

      questions.add(Question(
        author: entry[i].user.userToAuthor(),
        question: entry[i].entry.value,
        content:  entry[i].entry.value,
        created_at: 'Created at',
        repliesCount: 5,
        views: 10,
        votes: 2,
        


      ));

    }

return questions;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    
  }
  @override
  Widget build(BuildContext context) {
    
    return FutureBuilder(
      future: Provider.of<AppProvider>(context ).getAllEntryForAtopicWithDetails(widget.topic),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            print(snapshot.data);
            if (!snapshot.hasData || snapshot.data.isEmpty) {
              return CircularProgressIndicator();
            }
            else{


              return Column(
        children: convertEntryToAQuestions( snapshot.data).map((question) =>
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PostScreen(
                      question: question,
                    )
                  )
                );
              },
              child: Container(
                height: 180,
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration( 
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [BoxShadow(
                    color: Colors.black26.withOpacity(0.05),
                    offset: Offset(0.0,6.0),
                    blurRadius: 10.0,
                    spreadRadius: 0.10
                  )]
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column( 
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 70,  
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundImage: NetworkImage(question.author.imageUrl),
                                  radius: 22,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Expanded(
                                                                            child: Container( 
                                          width: MediaQuery.of(context).size.width * 0.55,
                                          child: Text(
                                            question.question,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: .4
                                            ),
                                          ),
                                        ),
                                      ), 
                                      SizedBox(height: 2.0),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            question.author.name,
                                            style: TextStyle(
                                              color: Colors.grey.withOpacity(0.6)
                                            ),
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            '20/12/2020',
                                            style: TextStyle(
                                              color: Colors.grey.withOpacity(0.6)
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Themify.bookmark,
                              color: Colors.grey.withOpacity(0.6),
                              size: 26,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50, 
                        child: Center(
                          child: Text(
                            "sdfsfsd.",
                            style: TextStyle(
                              color: Colors.grey.withOpacity(0.8),
                              fontSize: 16,
                              letterSpacing: .3
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Themify.thumb_up,
                                color: Colors.grey.withOpacity(0.6),
                                size: 22,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                "${question.votes} votes",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.withOpacity(0.6),
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Themify.email,
                                color: Colors.grey.withOpacity(0.6),
                                size: 16,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                "${question.repliesCount} replies",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.withOpacity(0.6)
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Themify.eye,
                                color: Colors.grey.withOpacity(0.6),
                                size: 18,
                              ),
                              SizedBox(width: 4.0),
                              Text(
                                "${question.views} views",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.withOpacity(0.6)
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ).toList()
      );
            }
           },
     
    );
  }
}