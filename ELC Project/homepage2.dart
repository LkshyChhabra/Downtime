// import 'package:first_app/Shop_App/Drawer.dart';
import './drawer.dart';
import 'package:flutter/material.dart';
import './ServiceCard.dart';

class HomePage2 extends StatefulWidget {
  @override
  _HomePage2State createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
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
          color: Colors.green.withOpacity(0),
          height: 900,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60.0),
                    ),
                    child: Image(
                      image: AssetImage('assets/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      // topRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(60.0),
                    ),
                    color: Color(0xff822659),
                  ),
                  height: 300),
              Container(
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
                            margin: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
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
                          letterSpacing: 1,
                          fontSize: 30,
                          // fontFamily: 'Gowun Dodum',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        )),
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
                        ServiceCard(" Mechanic", 'assets/Mechanic.png', 25),
                      ],
                    ),
                    // ServiceCard("Electricion"),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
