import 'package:software_technology/client/api-connection.dart';
import 'package:software_technology/models/entry.dart';
import 'package:software_technology/models/entry_detailed_model.dart';
import 'package:software_technology/models/topic.dart';

class EntryRepository{

EntryRepository._();

static final EntryRepository entryRepository = EntryRepository._();


getEntriesNameByTopicId(Topic topic)async {

List<Map<String,dynamic>> listOfEntriesByTopicMap = await ApiClient.apiClient.getEntriesNameByTopicId(topic.id.toString());

List<Entry> allEntriesByTopicList = [];


for(int i=0 ; i<listOfEntriesByTopicMap.length ; i++){
  allEntriesByTopicList.add(Entry.fromJson(listOfEntriesByTopicMap[i]));
}


return allEntriesByTopicList;

}

getAllEntryWithDetails() async {
  List<EntryDetaild> allEntryWithDetails = [];
List<Map<String,dynamic>> listOfAllEntryWithDetailsMap = await ApiClient.apiClient.getAllEntryWithDetails();

for(int i=0 ; i<listOfAllEntryWithDetailsMap.length ; i++){
  allEntryWithDetails.add(EntryDetaild.fromJson(listOfAllEntryWithDetailsMap[i]));
}

return allEntryWithDetails;

}

addNewEntry(EntryDetaild entryDetaild)async{
Map<String , dynamic > userToMap = entryDetaild.toJson();

String status = await ApiClient.apiClient.addNewEntry(userToMap , entryDetaild);

return status;

}




}