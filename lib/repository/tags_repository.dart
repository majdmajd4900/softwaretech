import 'package:software_technology/client/api-connection.dart';
import 'package:software_technology/models/tag.dart';
import 'package:software_technology/models/topic.dart';

class TagsRepository{

TagsRepository._();

static final TagsRepository tagsRepository = TagsRepository._();


getAllTags()async {

List<Map<String,dynamic>> listOfTagsMap = await ApiClient.apiClient.getAllTags();

List<Tag> allTagsList = [];

for(int i=0 ; i<listOfTagsMap.length ; i++){
  allTagsList.add(Tag.fromJson(listOfTagsMap[i]));
}


return allTagsList;

}




}