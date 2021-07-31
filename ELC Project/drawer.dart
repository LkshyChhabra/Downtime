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
            title: Text('Welcome',
                style: TextStyle(
                  letterSpacing: 1.3,
                  fontSize: 25,
                  fontFamily: 'Gowun Dodum',
                )),
            automaticallyImplyLeading: false,
          ),
          SizedBox(height: 14),
          FlatButton(
            child: Row(children: <Widget>[
              Icon(
                Icons.home,
              ),
              SizedBox(width: 12),
              Text(
                'Home Page',
                style: TextStyle(fontSize: 20),
              ),
            ]),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('HomePage');
            },
          ),
          FlatButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.add),
                SizedBox(width: 12),
                Text(
                  'Add User',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/AddUserScreen');
            },
          ),
          FlatButton(
            child: Row(
              children: <Widget>[
                Icon(Icons.logout),
                SizedBox(width: 12),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          SizedBox(height: 500),
          Text("______________________________________",
              style: TextStyle(color: Colors.grey)),
          SizedBox(height: 20),
          Row(
            children: <Widget>[
              Text("     Made with ",
                  style: TextStyle(
                      fontFamily: 'Gowun Dodum',
                      fontSize: 20,
                      color: Colors.pink.shade200)),
              Icon(Icons.favorite, size: 40, color: Colors.purple),
              Text(" by team : ",
                  style: TextStyle(
                      fontFamily: 'Gowun Dodum',
                      fontSize: 20,
                      color: Colors.pink.shade200)),
            ],
          ),
          Text(
            "     The CodeBrewers",
            style: TextStyle(
              fontFamily: 'Gowun Dodum',
              color: Colors.pink.shade400,
              fontWeight: FontWeight.bold,
              fontSize: 27,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
