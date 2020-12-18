import 'package:software_technology/client/api-connection.dart';
import 'package:software_technology/models/topic.dart';

class TopicsRepository{

TopicsRepository._();

static final TopicsRepository topicsRepository = TopicsRepository._();


getAllTopics()async {

List<Map<String,dynamic>> listOfTopicsMap = await ApiClient.apiClient.getAllTopics();

List<Topic> allTopicsList = [];

for(int i=0 ; i<listOfTopicsMap.length ; i++){
  allTopicsList.add(Topic.fromJson(listOfTopicsMap[i]));
}


return allTopicsList;

}




}