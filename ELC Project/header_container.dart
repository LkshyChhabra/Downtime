import 'package:flutter/material.dart';
// import 'package:flutterlogindesign/utils/color.dart';
import './color.dart';

class HeaderContainer extends StatelessWidget {
  var text = "Login";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Color(0xffE5A1E0), Color(0xff822659)],
            begin: Alignment.topLeft,
            end: Alignment(0.0, 0.4),
          ),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Image(
                      image: AssetImage('assets/logo.png'), height: 300))),
        ],
      ),
    );
  }
}
