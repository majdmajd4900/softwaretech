
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:flutter_login_signup/src/signup.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:software_technology/provider/provider.dart';
import 'package:software_technology/ui/login/Widget/bezierContainer.dart';
import 'package:software_technology/ui/login/signup.dart';



//import 'Widget/bezierContainer.dart';

class LoginPage1 extends StatefulWidget {
  LoginPage1({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage1> {
  String userName,password;
  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
saveEmail(String userName){
  this.userName = userName;
}

savePassword(String password){
  this.password = password;
}

 validatString(String value) {
    if (value == null || value == '') {
      return 'this field is required';
    }
  }

  // validatEmail(String value) {
  //   if (value == null || value == '') {
  //     return 'this field is required';
  //   } else if (!isEmail(value)) {
  //     return 'invalid email syntax';
  //   }
  // }

   GlobalKey<FormState> formKey = GlobalKey();

  submitForm(BuildContext context) async{
    
    
     if (formKey.currentState.validate()) {
       // Dialogs.showLoadingDialog(context, );
       formKey.currentState.save();

       var status =  await Provider.of<AppProvider>(context , listen: false).userLogin(this.userName, this.password);

       if(status is  String){
         Fluttertoast.showToast(msg: 'Login Error ' + status,toastLength: Toast.LENGTH_LONG,textColor: Colors.red,);
         return status;
       }else{
         Fluttertoast.showToast(msg: 'Logged in Successfully',toastLength: Toast.LENGTH_LONG,textColor: Colors.green,);
         await Provider.of<AppProvider>(context,listen: false).getAllTopicsList();
         await Provider.of<AppProvider>(context,listen: false).getAllTags();
         Navigator.of(context).popAndPushNamed('/home-page');
       }




     }
  //     FirebaseUser user =await Auth.auth.loginUsingEmailAndPasswordd(email, password);
  //     print(user);
  //   //Dialogs.showLoadingDialog(context);
  //   if(user != null){
  //     try{
  //       var userInstance = user;
  //       print('here');
  //  await Provider.of<EstateAtrributeProvider>(context,listen: false).setLoggedUser(userInstance);
     
  //     Navigator.of(context).popAndPushNamed('/estate-page');
  //     }
  //     catch(error){
    

  //       }
  //   }else{
  //     print('else');
  //         Fluttertoast.showToast(msg: 'Login Error , Please check email or password',toastLength: Toast.LENGTH_LONG,textColor: Colors.red,);
  //       //Navigator.of(context).popAndPushNamed('/login-page1');
  //               Navigator.of(context).pop();
  //   }
     
  //     }
  }

  Widget _entryField(String title,
      {bool isPassword = false,
      Function onSaved,
      Function validator}) {
    return Container(
      color : Color.fromRGBO(255, 255, 255, 0.03),
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (value)=> validator(value),
            onSaved: (newValue)=> onSaved(newValue),
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: (){
        //Navigator.of(context).pushNamed('/home-screen');
        submitForm(context);
       
        
      },
          child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [ Color(0xff7AA1EC),Color(0xff1E62E8),])),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: Text('Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color(0xff1E62E8),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'L',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color(0xff1E62E8),
          ),
          children: [
            TextSpan(
              text: 'exi',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'Go',
              style: TextStyle(color: Color(0xff1E62E8), fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Form(
      key:formKey,
          child: Column(
        children: <Widget>[
          _entryField("User name",
          validator: validatString,
          onSaved: saveEmail,
          
          ),
          _entryField("Password", isPassword: true , 
          validator:validatString,
          onSaved: savePassword ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                  _divider(),
                  _facebookButton(),
                  SizedBox(height: height * .055),
                  _createAccountLabel(),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, ) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
              //    key: key,
              //    backgroundColor: Colors.black54,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        HeartbeatProgressIndicator(
                          child: Icon(Icons.home,color: Colors.blueAccent,),
                        ),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }
}