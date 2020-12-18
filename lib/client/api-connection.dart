import 'package:http/http.dart' as http;
import 'package:software_technology/models/entry_detailed_model.dart';
import 'package:software_technology/models/topic.dart';
import 'dart:convert';

import 'package:software_technology/models/users.dart';

class ApiClient {
  ApiClient._();
  static final ApiClient apiClient = ApiClient._();
  String baseUrl = 'http://9603148a0777.ngrok.io';
  http.Client client;

  http.Client initClient() {
    if (client == null) {
      client = http.Client();
      return client;
    } else {
      return client;
    }
  }

  Future<List<Map<String, dynamic>>> getAllUsers() async {
    try {
      client = initClient();
      http.Response response = await client.get('$baseUrl/users');
      String stringResponse = response.body;
      //print(json.decoder);
      List<Map<String, dynamic>> responseMapAsList = [];

      List<dynamic> responseList = json.decode(stringResponse);
      for (int i = 0; i < responseList.length; i++) {
        responseMapAsList
            .add(Map<String, dynamic>.from(responseList[i]) as Map);
      }
      //   print(Map<String, dynamic>.from(responseMap[1]));
      //Map<String,dynamic> res = json.decode(responseMap[1]) as Map;
      // print(res);
      // print(responseMapAsList.length);
      return responseMapAsList;
    } catch (error) {
      print(error);
    }
  }

  CreateNewUser(Map<String, dynamic> data) async {
    try {
      client = initClient();

      // Users user = Users(
      //     email: 'test@test.com', username: 'testUsername', password: '123456');
      // data = user.toJson();
      http.Response response = await client.post('$baseUrl/register/user',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(data));
      print(response.body);
      print(json.encode(data));

      return response.body;
      //   print(data);
      //   http.post(url) response = await client.post('$baseUrl/register/user' , body: data);
      //   print(response.body);
      // //  return response.body;
    } catch (error) {
      print(error);
    }
  }


  userLogin(String userName , String password) async{

    

    


       try {
      client = initClient();
      http.Response response = await client.get('$baseUrl/login/user/$userName');
      //print(response.contentLength);
      //print('$baseUrl/login/user/306');
      //print(response.body);
      String stringResponse = response.body;

      print(stringResponse);

      if(response.contentLength==0){
        //print('asdadads');
        return false;
      }

       Map<String , dynamic>  userDetails= json.decode(stringResponse);

       
      // print(userDetails.values);

       return userDetails = Map<String, dynamic>.from(userDetails) as Map;


    } catch (error) {
      print(error);
    }

  }



  Future<List<Map<String, dynamic>>> getAllTags() async {
    try {
      client = initClient();
      http.Response response = await client.get('$baseUrl/tags');
      String stringResponse = response.body;
      //print(json.decoder);
      List<Map<String, dynamic>> responseMapAsList = [];

      List<dynamic> responseList = json.decode(stringResponse);
      for (int i = 0; i < responseList.length; i++) {
        responseMapAsList
            .add(Map<String, dynamic>.from(responseList[i]) as Map);
      }
      //   print(Map<String, dynamic>.from(responseMap[1]));
      //Map<String,dynamic> res = json.decode(responseMap[1]) as Map;
      // print(res);
      // print(responseMapAsList.length);
      return responseMapAsList;
    } catch (error) {
      print(error);
    }
  }


    Future<List<Map<String, dynamic>>> getAllTopics() async {
    try {
      client = initClient();
      http.Response response = await client.get('$baseUrl/topics');
      String stringResponse = response.body;
      //print(response.body);
      List<Map<String, dynamic>> responseMapAsList = [];

      List<dynamic> responseList = json.decode(stringResponse);
      for (int i = 0; i < responseList.length; i++) {
        responseMapAsList
            .add(Map<String, dynamic>.from(responseList[i]) as Map);
      }
      //   print(Map<String, dynamic>.from(responseMap[1]));
      //Map<String,dynamic> res = json.decode(responseMap[1]) as Map;
      // print(res);
       print(responseMapAsList.length);
      return responseMapAsList;
    } catch (error) {
      print(error);
    }
  }


  Future<List<Map<String, dynamic>>> getEntriesNameByTopicId(String topicId) async {
    try {
      client = initClient();
      http.Response response = await client.get('$baseUrl/topic/$topicId/entrys');
      String stringResponse = response.body;
      //print(json.decoder);
      List<Map<String, dynamic>> responseMapAsList = [];

      List<dynamic> responseList = json.decode(stringResponse);
      for (int i = 0; i < responseList.length; i++) {
        responseMapAsList
            .add(Map<String, dynamic>.from(responseList[i]) as Map);
      }
      //   print(Map<String, dynamic>.from(responseMap[1]));
      //Map<String,dynamic> res = json.decode(responseMap[1]) as Map;
      // print(res);
      // print(responseMapAsList.length);
      return responseMapAsList;
    } catch (error) {
      print(error);
    }
  }


Future<List<Map<String, dynamic>>> getAllEntryWithDetails() async {
    try {
      client = initClient();
      http.Response response = await client.get('$baseUrl/entrys/get');
      String stringResponse = response.body;
      //print(json.decoder);
      List<Map<String, dynamic>> responseMapAsList = [];

      List<dynamic> responseList = json.decode(stringResponse);
      for (int i = 0; i < responseList.length; i++) {
        responseMapAsList
            .add(Map<String, dynamic>.from(responseList[i]) as Map);
      }
      //   print(Map<String, dynamic>.from(responseMap[1]));
      //Map<String,dynamic> res = json.decode(responseMap[1]) as Map;
      // print(res);
      // print(responseMapAsList.length);
      // print(responseMapAsList);
      return responseMapAsList;
    } catch (error) {
      print(error);
    }
  }


  addNewEntry(Map<String, dynamic> data , EntryDetaild entryDetaild) async {
    try {
      
      client = initClient();

      // Users user = Users(
      //     email: 'test@test.com', username: 'testUsername', password: '123456');
      // data = user.toJson();
      print(data);
      http.Response response = await client.post('$baseUrl/${entryDetaild.user.id}/${entryDetaild.topic.id}/entry',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: json.encode(data).substring(9).replaceFirst('}', ''));
          print('$baseUrl/${entryDetaild.user.id}/${entryDetaild.topic.id}/entry');
      //print(response.body);
      print(json.encode(data).substring(9).replaceFirst('}', ''));
     // String s = json.encode(data).substring(9);
     // s.replaceFirst('}', '');
     // print(s);

      return response.body;
      //   print(data);
      //   http.post(url) response = await client.post('$baseUrl/register/user' , body: data);
      //   print(response.body);
      // //  return response.body;
    } catch (error) {
      print(error);
    }
  }

}
