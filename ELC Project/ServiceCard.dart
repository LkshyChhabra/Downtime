// import 'dart:html';

import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  String imagee;
  String name;
  double he;
  ServiceCard(String text, String i, double h) {
    name = text;
    he = h;
    imagee = i;
  }
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          '/Workers',
          arguments: name,
        );
      },
      child: Container(
          decoration: BoxDecoration(
              // boxShadow: [BoxShadow(color: Colors.black, blurRadius: 10)],
              color: (Colors.green.withOpacity(0)),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          height: 300,
          width: 170,
          child: Stack(
            children: <Widget>[
              Positioned(
                  bottom: 10,
                  left: 5,
                  child: Container(
                      height: 220,
                      width: 150,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(5, 7),
                                color: Color(0xffca4b92),
                                blurRadius: 5)
                          ],
                          color: (Color(0xffE5A1E0)),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20))))),
              Positioned(
                bottom: 30,
                left: 22,
                child: ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 120),
                  child: Text(
                    name,
                    style: TextStyle(
                        fontSize: he,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gowun Dodum',
                        letterSpacing: 2),
                  ),
                ),
              ),
              Positioned(
                  left: 20,
                  bottom: 100,
                  height: 200,
                  width: 200,
                  child: Image(image: AssetImage(imagee))
                  // 'https://banner2.cleanpng.com/20180516/uiq/kisspng-carpenter-cartoon-royalty-free-5afc7cffe9f736.9362684015264965119583.jpg')

                  // Text("image")
                  // Image.network(
                  //     'data:image/jpeg;base64,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'),
                  // right: 50,
                  ),
            ],
          )),
    );
  }
}
