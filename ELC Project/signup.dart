import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './Homepage.dart';
import './color.dart';
import './btn_widget.dart';
import './header_container.dart';
import './login.dart';
import './Auth.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
  // Provider.of<Auth>(context);
  String token;
  String userid;
  DateTime expirydate;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future<void> signup(String em, String pass) async {
    print(em);
    print(pass);

    var url =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBZpXzXMdvb3eKjF2c3WQ7eB1xk_GfSR1g';
    // 'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyBZpXzXMdvb3eKjF2c3WQ7eB1xk_GfSR1g';

    //const url = 'https://firstshopapplication.firebaseio.com/products.json';
    try {
      var response = await http.post(
        url,
        body: json.encode(
          {
            'email': em.trim(),
            'password': pass.trim(),
            'returnSecureToken': true
          },
        ),
      );
      var resData = json.decode(response.body);
      if (resData['error'] != null) {
        print("some error is there.......");
        print(resData['error']['message']);
        throw (resData['error']['message']);
      }

      print('no error');
      token = resData['idToken'];
      userid = resData['localId'];
      expirydate = DateTime.now()
          .add(Duration(seconds: int.parse(resData['expiresIn'])));
      // notifyListeners();
    } catch (error) {
      print("inside catch");
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Error Occurred!'),
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

      print("error caught");
      throw error;
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  Future<void> _submit() async {
    // if (!_formKey.currentState.validate()) {
    //   // Invalid!
    //   return;
    // }
    // _formKey.currentState.save();
    // setState(() {
    //   _isLoading = true;
    // });

    // Log user in
    await Provider.of<Auth>(context, listen: false)
        .signin(_authData['email'], _authData['password']);
  }

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Register"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "Fullname", icon: Icons.person),
                    _textInput(
                        controller: email, hint: "Email", icon: Icons.email),
                    _textInput(hint: "Phone Number", icon: Icons.call),
                    _textInput(
                        controller: password,
                        hint: "Password",
                        icon: Icons.vpn_key),
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          btnText: "REGISTER",
                          onClick: () {
                            signup(email.text, password.text);
                            // Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Already a member ? ",
                            style: TextStyle(color: Colors.black)),
                      ]),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Colors.orange,
                        textStyle: const TextStyle(fontSize: 15),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: const Text('Login',
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

  Widget _textInput({controller, hint, icon}) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        onSaved: (value) {
          _authData[controller] = value;
        },
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
