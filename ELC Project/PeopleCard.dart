import 'package:first_app/ELC%20Project/ProfileScreen.dart';
import 'package:flutter/material.dart';

class PeopleCard extends StatelessWidget {
  String name, time, location, salary, url, bio;
  PeopleCard(
      this.name, this.time, this.location, this.salary, this.url, this.bio);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (ctx) => ProfileScreen(name, url, bio)));
      },
      child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Color(0xffE5A1E0),
          ),
          height: 150,
          width: 400,
          child: Row(children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10, left: 10),
              child: Hero(
                tag: "h1",
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundImage: NetworkImage(url),
                ),
              ),
            ),
            SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 30),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Timings :- $time",
                  style: TextStyle(fontSize: 13, letterSpacing: 1),
                ),
                Text(
                  "Location:- $location",
                  style: TextStyle(fontSize: 13, letterSpacing: 1),
                ),
                Text(
                  "₹$salary/ mon",
                  style: TextStyle(fontSize: 13, letterSpacing: 1),
                ),
              ],
            )
          ])),
    );
  }
}
