import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreen createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextStyle textFieldstyle = TextStyle(fontFamily: 'Montserrat', fontSize: 15.0);
  @override
  Widget build(BuildContext context) {
    final gmailLoginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red[800],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          //Perform  google login
        },
        child: Text("Login with Gmail",
          textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ),
    );

    final faceBookLoginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue[800],
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          //Perform  google login
        },
        child: Text("Login with Facebook",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)
        ),
      ),
    );

    final nameTextField = TextField(
      obscureText: false,
      style: textFieldstyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final mobileNumberTextField = TextField(
      obscureText: false,
      style: textFieldstyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mobile Number",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final emailTextField = TextField(
      obscureText: false,
      style: textFieldstyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordTextField = TextField(
      obscureText: false,
      style: textFieldstyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final confirmPwdTextField = TextField(
      obscureText: false,
      style: textFieldstyle,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 15.0),
          hintText: "Confirm Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final registerButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.yellow,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: (){
          //Perform  google login

        },
        child: Text("Register",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.blue, fontWeight: FontWeight.bold)
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
          title: const Text('Registration'),
      ),
     body: Center(
       child: SingleChildScrollView(
         child: Container(
           color: Colors.white,
           child: Padding(
             padding: const EdgeInsets.all(36.0),
             child: Column(
               children: <Widget>[
                  Container(
                    color:Colors.grey[300],
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 10.0),
                          gmailLoginButton,
                          SizedBox(height: 10.0),
                          faceBookLoginButton,
                        ],
                      ),
                    ),
                  ),
                 SizedBox(height: 10.0),
                 Text("OR Create an Account",
                     style: style.copyWith(
                         color: Colors.black, fontWeight: FontWeight.bold)),
                 SizedBox(height: 15.0),
                 nameTextField,
                 SizedBox(height: 15.0),
                 emailTextField,
                 SizedBox(height: 15.0),
                 mobileNumberTextField,
                 SizedBox(height: 15.0),
                 passwordTextField,
                 SizedBox(height: 15.0),
                 confirmPwdTextField,
                 SizedBox(height: 35.0),
                 registerButton,
               ],
             ),
           ),
         ),
       ),
     ),
    );
  }
}
