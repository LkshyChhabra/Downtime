import 'package:first_app/ELC%20Project/PeopleCard.dart';
import 'package:first_app/ELC%20Project/Workers2.dart';
import './drawer.dart';
import 'package:flutter/material.dart';
import './ServiceCard.dart';
import 'dart:convert';
import './UserClass.dart';
import 'package:http/http.dart' as http;

import 'Data.dart';

class Workers extends StatefulWidget {
  String type;
  Workers(x) {
    type = x;
  }
  @override
  _WorkersState createState() => _WorkersState();
}

class _WorkersState extends State<Workers> {
  bool isLoading = true;
  Future<void> getProductsFirebase() async {
    // var url =
    //     ('https://firstshopapplication.firebaseio.com/products.json?auth=$userToken');
    var url = 'https://firstshopapplication.firebaseio.com/DowntimeUsers.json';
    var prodFirebase = await http.get(url);
//    print((prodFirebase.body));
    final fetchedData =
        json.decode((prodFirebase.body)) as Map<String, dynamic>;
    List<UserClass> fetchedList = [];
    if (fetchedData != null) {
      fetchedData.forEach((key, value) {
        fetchedList.add(UserClass(
            value['name'],
            value['location'],
            value['serviceType'],
            value['salary'],
            value['rating'],
            value['timings'],
            value['url'],
            value['bio']));
        print('item added');
      });
    }
    print('added successfully');
    isLoading = false;
    users = fetchedList;
    for (int i = 0; i < users.length; i++) {
      print(users[i].url);
    }
    // notifyListeners();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    // if (instate) {
    isLoading = true;
    //   Provider.of<ProductProvider>(context)
    //       .getProductsFirebase()
    //       .then((value) => _isloading = false);
    // }
    // instate = false;

    getProductsFirebase();
    super.didChangeDependencies();
  }

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
                height: 30,
              ),
              // PeopleCard(),
              SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    ListView.builder(
                        // physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return PeopleCard(
                              users[index].name,
                              users[index].timings,
                              users[index].location,
                              (users[index].salary).toString(),
                              users[index].url,
                              users[index].bio);
                        })
                  ],
                ),
              )
              // ServiceCard("Electricion"),
            ],
          ),
        ));
  }
}
