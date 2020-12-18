import 'package:software_technology/client/api-connection.dart';
import 'package:software_technology/models/users.dart';

class UserRepository {

UserRepository._();

static final UserRepository userRepository = UserRepository._();



getUsersFromClient()async{

List<Map<String, dynamic>> listOfUsersMap = await ApiClient.apiClient.getAllUsers();

List<Users> allUsersList = [];

for(int i=0 ; i<listOfUsersMap.length ; i++){
  allUsersList.add(Users.fromJson(listOfUsersMap[i]));
}

// print(allUsersList.length);
// print(allUsersList[1].id);
// print(allUsersList[5].password);
}



createUser(Users user) async{

Map<String , dynamic > userToMap = user.toJson();

String status = await ApiClient.apiClient.CreateNewUser(userToMap);

return status;


}

userLogin(String userName , String password) async{


var status = await ApiClient.apiClient.userLogin(userName , password);
if(status is bool){
  return false;

}

status = Users.fromJson(status);

if(password != status.password){

  return 'Pleas check the password';
}


return status;


}


}