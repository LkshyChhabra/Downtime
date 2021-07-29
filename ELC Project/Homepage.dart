// import 'package:first_app/Shop_App/Drawer.dart';
import './drawer.dart';
import 'package:flutter/material.dart';
import './ServiceCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff822659),
          title: Container(
              margin: EdgeInsets.only(left: 30),
              child: Image.asset('assets/logo1.png', height: 220, width: 220)),
        ),
        drawer: DrawerDisplay(),
        backgroundColor: Colors.purple[50],
        body: Container(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 5,
                    child: Card(
                      child: TextFormField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'London...',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15)),
                      ),
                      elevation: 10,
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      //shadowColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  Expanded(
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xff822659),
                      child: IconButton(
                        icon: Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print('aa');
                        },
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                  )
                ],
              ),
              // Text("This is home page"),
              SizedBox(
                height: 20,
              ),
              Text("MOST POPULAR",
                  style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 30,
                      fontFamily: 'Gowun Dodum',
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              Row(
                children: <Widget>[
                  SizedBox(width: 30),
                  ServiceCard("Chauffeur", 'assets/Driver.png', 24),
                  SizedBox(width: 30),
                  ServiceCard("Domestic Worker", 'assets/Maid.png', 26),
                ],
              ),
              SizedBox(height: 40),
              Row(
                children: <Widget>[
                  SizedBox(width: 30),
                  ServiceCard("     Laundry", 'assets/Laundry.png', 26),
                  SizedBox(width: 30),
                  ServiceCard(" Mechanic", 'assets/Electrician.png', 25),
                ],
              ),
              // ServiceCard("Electricion"),
            ],
          ),
        ));
  }
}
