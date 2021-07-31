import 'package:flutter/foundation.dart';
// import 'HttpException.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String token;
  String userid;
  DateTime expirydate;

  bool get isAuth {
    print(token != null);
    return token != null;
  }

  String get tokens {
    if (token != null &&
        expirydate != null &&
        expirydate.isAfter(DateTime.now())) {
      return token;
    }
    return null;
  }

  Future<void> signup(String em, String pass) async {
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
        // throw (HttpException(resData['error']['message']));
      }
      print('no error');
      token = resData['idToken'];
      userid = resData['localId'];
      expirydate = DateTime.now()
          .add(Duration(seconds: int.parse(resData['expiresIn'])));
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signin(String em, String pass) async {
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
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
}
