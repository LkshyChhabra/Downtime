import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:http/http.dart' as http;
import './homepage2.dart';
import './color.dart';
import './btn_widget.dart';
import 'dart:convert';

import './header_container.dart';
import './Homepage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  String token;
  String userid;
  DateTime expirydate;

  Future<void> signin(String em, String pass) async {
    print(em);
    print(pass);
    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBZpXzXMdvb3eKjF2c3WQ7eB1xk_GfSR1g';

    //const url = 'https://firstshopapplication.firebaseio.com/products.json';
    try {
      var response2 = await http.post(
        url,
        body: json.encode(
          {
            'email': em.trim(),
            'password': pass.trim(),
            'returnSecureToken': true
          },
        ),
      );
      var resData = json.decode(response2.body);
      if (resData['error'] != null) {
        print(resData['error']['message']);
        print("some error is there.......");
        throw (resData['error']['message']);
      }
      print('no error');
      token = resData['idToken'];
      userid = resData['localId'];
      expirydate = DateTime.now()
          .add(Duration(seconds: int.parse(resData['expiresIn'])));
      print(expirydate.toString());
      // notifyListeners();
    } catch (error) {
      print("inside catch");
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error Occured!'),
          content: Text(error),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      throw error;
    }
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage2()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(
                        x: false,
                        controller: email,
                        hint: "Email",
                        icon: Icons.email),
                    _textInput(
                        x: true,
                        controller: password,
                        hint: "Password",
                        icon: Icons.vpn_key),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text("Need Help?",
                            style: TextStyle(color: Colors.black54)),
                        onPressed: () {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Contact:- \nTeam CodeBrewers'),
                              content: Text("codebrewers@downtime.com"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          onClick: () {
                            signin(email.text, password.text);
                          },
                          btnText: "LOGIN",
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account ? ",
                            style: TextStyle(color: Colors.black)),
                      ]),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.orange,
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RegPage()));
                      },
                      child: const Text('Register',
                          style: TextStyle(color: Color(0xffE26FDE))),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textInput({controller, hint, icon, x}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        obscureText: x,
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
