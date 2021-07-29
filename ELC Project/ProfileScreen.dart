import 'package:flutter/material.dart';
import './Data.dart';

class ProfileScreen extends StatelessWidget {
  String name, url, description;
  ProfileScreen(this.name, this.url, this.description);
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    // final name = ModalRoute.of(context).settings.arguments;
    // user = users.where();
    return Scaffold(
        backgroundColor: Colors.purple[50],
        body: Container(
          child: Column(children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    // padding: EdgeInsets.all(10),
                    icon: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Color(0xff822659),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/Workers',
                        // arguments: name,
                      );
                    },
                    padding: EdgeInsets.all(50),
                  ),
                  // SizedBox(width: 100),
                  IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      size: 30,
                      color: Color(0xff822659),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        '/Workers',
                        // arguments: name,
                      );
                    },
                    padding: EdgeInsets.all(50),
                  ),
                ]),
            SizedBox(height: 100),
            Hero(
              tag: "h1",
              child: CircleAvatar(
                radius: 90.0,
                backgroundImage: NetworkImage(url),
              ),
            ),
            SizedBox(height: 90),
            Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.purple[200],
                          blurRadius: 7.0,
                          offset: Offset(0.0, -10))
                    ],
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.purple[80],
                    //     blurRadius: 10.0,
                    //     // offset: Offset(0.0, 15)
                    //   )
                    // ],
                    color: Color(0xffE5A1E0),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0))),
                height: 350,
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20),
                    Text(name, style: TextStyle(fontSize: 40)),
                    SizedBox(height: 30),
                    Text(description),
                  ],
                )),
            SizedBox(height: 20),
            Container(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  padding:
                      EdgeInsets.only(top: 12, bottom: 12, left: 40, right: 40),
                  child: Text("HIRE ME",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      )),
                  onPressed: () {},
                  color: Color(0xff822659),
                ),
                SizedBox(width: 40),
                RaisedButton(
                  padding:
                      EdgeInsets.only(top: 12, bottom: 12, left: 25, right: 25),
                  child: Text("FREE DEMO",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  onPressed: () {},
                  color: Color(0xff822659),
                ),
              ],
            )),
          ]),
        ));
  }
}
