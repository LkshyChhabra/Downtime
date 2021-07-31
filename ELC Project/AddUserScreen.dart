import 'package:flutter/material.dart';
import './drawer.dart';
import './Data.dart';
import 'dart:convert';

import './UserClass.dart';
import 'package:http/http.dart' as http;

class AddUserScreen extends StatefulWidget {
  @override
  _AddUserScreenState createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController name = new TextEditingController();
  TextEditingController url = new TextEditingController();
  TextEditingController startTime = new TextEditingController();
  TextEditingController endtime = new TextEditingController();
  TextEditingController location = new TextEditingController();
  TextEditingController salary = new TextEditingController();
  TextEditingController serviceType = new TextEditingController();
  TextEditingController bio = new TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Future<void> addUser(UserClass newUser) async {
      print(
          "inside AddUSer!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
      // final url =
      //     ('https://firstshopapplication.firebaseio.com/products.json?auth$userToken');
      const url =
          'https://firstshopapplication.firebaseio.com/DowntimeUsers.json';
      try {
        var response = await http.post(
          url,
          body: json.encode(
            {
              'name': newUser.name,
              'timings': newUser.timings,
              'location': newUser.location,
              'salary': newUser.salary,
              'serviceType': newUser.serviceType,
              'url': newUser.url,
              'bio': newUser.bio,
            },
          ),
        );
        // newUser = UserClass(
        //     id: json.decode(response.body)['name'],
        //     price: newUser.price,
        //     imageUrl: newUser.imageUrl,
        //     prodTitle: newUser.prodTitle,
        //     prodDescription: newUser.prodDescription);
        print("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t");
        print(response);
        print("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t");
        // _itemList.add(newProd);
        // notifyListeners();
      } catch (error) {
        print(error);
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Error Occured!'),
            content: Text(error),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        throw error;
      }

      Navigator.of(context).pushReplacementNamed('HomePage');
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff822659),
          title: Container(
              margin: EdgeInsets.only(left: 30),
              child: Image.asset('assets/logo1.png', height: 220, width: 220)),
        ),
        drawer: DrawerDisplay(),
        backgroundColor: Colors.purple[50],
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),

                  // hintText: "  Name",
                  labelText: "Name",
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: serviceType,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  // hintText: "Service Type",
                  labelText: "Service Type",
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: location,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  // hintText: "Location",
                  labelText: "Location",
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: startTime,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  // hintText: "Start Time",
                  labelText: "Start Time",
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: endtime,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  // hintText: "EndTime",
                  labelText: "EndTime",
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: salary,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  // hintText: "Salary",
                  labelText: "Salary",
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: url,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  // hintText: "Salary",
                  labelText: "Image Url",
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: bio,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20.0),
                  // hintText: "Salary",
                  labelText: "Bio",
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff822659),
                    ),
                    onPressed: () async {
                      print("adding user");
                      addUser(
                        UserClass(
                          name.text,
                          location.text,
                          serviceType.text,
                          int.parse(salary.text),
                          4,
                          "${startTime.text} to ${endtime.text}",
                          url.text,
                          bio.text,
                        ),
                      );
                      // users.add(

                      // );
                      // users.map((e) => print(e.name));
                      // Validate returns true if the form is valid, or false otherwise.
                      // if (_formKey.currentState!.validate()) {
                      //   // If the form is valid, display a snackbar. In the real world,
                      //   // you'd often call a server or save the information in a database.
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(content: Text('Processing Data')),
                      //   );
                      // }
                    },
                    child: const Text(
                      'SUBMIT',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
