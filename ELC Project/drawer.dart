import 'package:flutter/material.dart';

class DrawerDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppBar(
            backgroundColor: Color(0xff822659),
            title: Text('Welcome'),
            automaticallyImplyLeading: false,
          ),
          FlatButton(
            child: Text(
              'Home Page',
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('HomePage');
            },
          ),
          FlatButton(
            child: Text('Add User', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/AddUserScreen');
            },
          ),
          FlatButton(
            child: Text('Logout', style: TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
    );
  }
}
