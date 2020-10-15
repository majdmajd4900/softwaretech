import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:string_validator/string_validator.dart';

import 'Widget/bezierContainer.dart';
import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
String name, password , email,mobilNoe;


saveName(String name){
  this.name = name;
}

saveEmail(String email){
  this.email = email;
}

savePassword(String password){
  this.password = password;
}

saveMobileNo(String mobileNo){
  this.mobilNoe = mobileNo;
}

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

  Widget _entryField(String title,
      {bool isPassword = false,
      TextInputType keyboardType = TextInputType.text,
      Function onSaved,
      Function validator}) {
    return Container(
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
              validator: (value) => validator(value),
              onSaved: (newValue) => onSaved(newValue),
              keyboardType: keyboardType,
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
        //submitForm(context);
        Navigator.of(context).pushNamed('/home-screen');
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
                colors: [
                  Color(0xff7AA1EC),
                  Color(0xff1E62E8),
                ])),
        child: Text(
          'Register Now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage1()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color(0xfff79c4f),
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

  validatNumber(String value) {
    if (value == null || value == '') {
      return 'this field is required';
    } else if (!isLength(value, 10, 10)) {
      return 'must be 10 digits';
    }
  }

  validatString(String value) {
    if (value == null || value == '') {
      return 'this field is required';
    }
  }

  validatEmail(String value) {
    if (value == null || value == '') {
      return 'this field is required';
    } else if (!isEmail(value)) {
      return 'invalid email syntax';
    }
  }

  GlobalKey<FormState> formKey = GlobalKey();

  submitForm(BuildContext context) async{
//     Dialogs.showLoadingDialog(context);
    
//     if (formKey.currentState.validate()) {
//       formKey.currentState.save();
//       FirebaseUser user =await Auth.auth.registerUsingEmailAndPassword(email, password);
//         //user.updateProfile(userUpdateInfo)
//         UserUpdateInfo userUpdateInfo =UserUpdateInfo();
//         //user.
        
      

      
//       Repository.repository.addNewUser(User(
// name: this.name,
// mobileNo: this.mobilNoe,
// id: user.uid,



//       ));
//       Navigator.of(context).popAndPushNamed('/login-page1');

//     } else {
//       return;
//     }
  }

  Widget _emailPasswordWidget() {
    return Form(
      key: formKey,
          child: Column(
        children: <Widget>[
          _entryField("Full Name", validator: validatString , onSaved: saveName,),
          _entryField("Email id",
              keyboardType: TextInputType.emailAddress, validator: validatEmail, onSaved: saveEmail),
          _entryField(
            "Mobil No",
            keyboardType: TextInputType.number,
            validator: validatNumber,
            onSaved: saveMobileNo
          ),
          _entryField(
            "Password",
            isPassword: true,
            validator: validatString,
            onSaved: savePassword,
          ),
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
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
