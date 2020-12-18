import 'author_model.dart';

class Users {
  int id;
  String username;
  String password;
  String role;
  String email;

  Users({this.id, this.username, this.password, this.role='user', this.email});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    password = json['password'];
    role = json['role'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  //  data['id'] = this.id;
    data['username'] = this.username;
    data['password'] = this.password;
    data['role'] = this.role;
    data['email'] = this.email;
    return data;
  }

  Author userToAuthor(){
    return Author(name: this.username , imageUrl: 'https://www.esafety.gov.au/sites/default/files/2019-07/protect_your_personal_information_0.jpg');
  }
}