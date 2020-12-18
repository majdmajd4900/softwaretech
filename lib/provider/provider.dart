import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:software_technology/models/entry.dart';
import 'package:software_technology/models/entry_detailed_model.dart';
import 'package:software_technology/models/tag.dart';
import 'package:software_technology/models/topic.dart';
import 'package:software_technology/models/users.dart';
import 'package:software_technology/repository/entry_repository.dart';
import 'package:software_technology/repository/tags_repository.dart';
import 'package:software_technology/repository/topics_repository.dart';
import 'package:software_technology/repository/users_repository.dart';

class AppProvider extends ChangeNotifier{


Users user ;
List<Topic> allTopicsList = [];
List<EntryDetaild> allEntryWithDetail=[];
List<Tag> listOfAllTags = [];

  int postsCount = 0;


createUser(Users user){

UserRepository.userRepository.createUser(user);
// if registerd login directly
this.user = user;

notifyListeners();

}

getCurrentUser(){
  return this.user;
}


userLogin(String userName , String password)async {

var status =await  UserRepository.userRepository.userLogin(userName, password);

if(status is bool){
  return status = 'Please check your userName';
}


if(status is String){
  return status = 'Please check your password';
}

this.user= status;
return status;

}

getAllTopicsList()async{

this.allTopicsList =  await TopicsRepository.topicsRepository.getAllTopics();

notifyListeners();

return this.allTopicsList;

}

getAllEntriesByTopicId(Topic topic)async{

 List<Entry> entryListByTopicId =   await EntryRepository.entryRepository.getEntriesNameByTopicId(topic);

return entryListByTopicId;
}

getAllEntryWithDetails()async{
  
  List<EntryDetaild> allEntryWithDetails =   await EntryRepository.entryRepository.getAllEntryWithDetails();
 
this.allEntryWithDetail=allEntryWithDetail;
  
return allEntryWithDetails;
}

getAllEntryForAtopicWithDetails(Topic topic)async{
  print(topic.id);
  List<EntryDetaild> detaildEntryForTopic=[];
  List<EntryDetaild> allEntries = await getAllEntryWithDetails();
  //print(allEntries.length.toString() + 'allEntries');
  
  //print(detaildEntryForTopic);
 // await getAllEntryWithDetails();
//print(detaildEntryForTopic.toString() + '1');
for(int i =0 ; i< allEntries.length ; i++){
  
  if(topic.id == allEntries[i].topic.id){
    print('topic.id');

    detaildEntryForTopic.add(allEntries[i]);

  }

  
}
return detaildEntryForTopic;
}

getPostsbyUserID(Users user)async{

  List<EntryDetaild> allPosts = await getAllEntryWithDetails();

  List<EntryDetaild> allPostsForAUSer=[];

  for(int i = 0 ; i<allPosts.length;i++){ 
    if(allPosts[i].user.id == user.id){
allPostsForAUSer.add(allPosts[i]);
    }

  }

this.postsCount = allPostsForAUSer.length;
return allPostsForAUSer;


}


getAllTags()async{
 List<Tag> listOfAllTags = await  TagsRepository.tagsRepository.getAllTags();
 return this.listOfAllTags= listOfAllTags;
}


addNewEntry(EntryDetaild entryDetaild)async{
  print(entryDetaild.toJson());
  var status = await EntryRepository.entryRepository.addNewEntry(entryDetaild);

  print(status);
}
}