// // import 'package:first_app/Shop_App/Edit_Add_Form_Screen.dart';
// // import 'package:first_app/Shop_App/Manage_products_Screen.dart';
// // import 'package:first_app/Shop_App/Order_Provider.dart';
// // import 'package:first_app/Shop_App/Orders_Screen.dart';
// // import 'package:first_app/Shop_App/Product_Provider.dart';
// // import 'package:first_app/Shop_App/Shop_Cart_Data.dart';
// // import 'package:flutter/material.dart';
// // import 'package:first_app/Shop_App/Shop_Home_Page.dart';
// // import 'package:first_app/Shop_App/Product_Detail.dart';
// // import 'package:provider/provider.dart';
// // import 'package:first_app/Shop_App/Shop_cart_Screen.dart';

// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatefulWidget {
// //   @override
// //   _MyAppState createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiProvider(
// //       providers: [
// //         ChangeNotifierProvider(
// //           create: (context) => ProductProvider(),
// //         ),
// //         ChangeNotifierProvider(
// //           create: (context) => ShopCartData(),
// //         ),
// //         ChangeNotifierProvider(
// //           create: (context) => OrderProvider(),
// //         ),
// //       ],
// //       child: MaterialApp(
// //         title: 'Myapp',
// //         theme: ThemeData(
// //           primaryColor: Colors.blueGrey.shade900,
// //           accentColor: Colors.orange.shade500,
// //           fontFamily: 'Lato',
// //         ),
// //         initialRoute: '/',
// //         routes: {
// //           '/':(ctx)=>ShopHomePage(),
// //           '/productDetails': (ctx) => ProductDetail(),
// //           '/CartScreen': (ctx) => ShopcartScreen(),
// //           '/orders': (cx) => OrdersScreen(),
// //           '/manageProducts': (ctx) => ManageProductsScreen(),
// //           '/editAddForm' : (ctx) => EditAddFormScreen(),
// //         },
// //       ),
// //     );
// //   }
// // }

// // //class GridTileDemo extends StatefulWidget {
// // //  createState() => _GridTitle();
// // //}
// // //
// // //class _GridTitle extends State<GridTileDemo> {
// // //  Widget build(BuildContext context) {
// // //    return MaterialApp(
// // //      home: SafeArea(
// // //        child: Scaffold(
// // //          body: Container(
// // //              height: 400,
// // //              color: Color(0xffc91b3a),
// // //              child: Image.network('https://asia.olympus-imaging.com/content/000090033.jpg', scale: 1, fit: BoxFit.cover),
// // ////              child:  GridView.count(
// // ////                  crossAxisCount: 2,
// // ////                  mainAxisSpacing: 10.0,
// // ////                  crossAxisSpacing: 4.0,
// // ////                  padding: const EdgeInsets.all(4.0),
// // ////                  childAspectRatio: 1.3,
// // ////                  children: <Widget>[
// // ////                    GridTile(
// // ////                      header: Text("GridTile header", style: TextStyle(color: Colors.white)),
// // ////                      child: Container(
// // ////                        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
// // ////                        child: Text("GridTile", style: TextStyle(color: Colors.white)),
// // ////                      ),
// // ////                      footer: Text("GridTile footer", style: TextStyle(color: Colors.white)),
// // ////                    ),
// // ////                    Image.network('https://asia.olympus-imaging.com/content/000090033.jpg', scale: 1, fit: BoxFit.cover)
// // ////                  ]
// // ////              )
// // //          ),
// // //        ),
// // //      ),
// // //    );
// // //  }
// // //}

// import 'package:first_app/StayVacay_App/DummyData.dart';
// import 'package:first_app/StayVacay_App/HotelModel.dart';
// import 'package:first_app/StayVacay_App/WishList.dart';
// import 'package:flutter/material.dart';
// import 'package:first_app/StayVacay_App/HomeScreenStay.dart';
// import 'package:first_app/StayVacay_App/StayTypeData.dart';
// import 'package:first_app/StayVacay_App/FiltersScreen.dart';
// import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;

// void main() {
//   runApp(MyApp());
// //runApp(MaterialApp(
// //  home: Scaffold(
// //    body: MaterialButton(
// //        color: Colors.deepOrangeAccent,
// //        onPressed: () async {
// //          final List<DateTime> picked = await DateRagePicker.showDatePicker(
// //              //context: context,
// //              initialFirstDate: (DateTime.now()).add(Duration(days:2)),
// //              initialLastDate: (DateTime.now()).add(Duration(days: 7)),
// //              firstDate: DateTime(2015),
// //              lastDate: DateTime(2022)
// //          );
// //          if (picked != null && picked.length == 2) {
// //            print(picked);
// //          }
// //        },
// //        child: Text("Pick date range")
// //    )
// //  ),
// //));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   List<StayTypeData> favList = [];
//   List<StayTypeData> filteredList = hotelData;
//   //List<StayTypeData> filteredList=hotelData;

//   Map<String, Object> filters = {
//     'slider': 1000,
//     'text': 500,
//     'apart': false,
//     'hotel': false,
//     'resort': false,
//     'flat': false,
//     'all': false,
//   };

//   void filterList(Map<String, Object> filtered) {
//     setState(() {
//       filters = filtered;
//       filteredList = hotelData.where((element) {
//         if (filters['hotel'] && element.type == Type.Hotel) {
//           if (element.pricePerNight < filters['text']) {
//             return true;
//           }
//           return false;
//         }
//         if (filters['apart'] && element.type == Type.Apartment) {
//           if (element.pricePerNight < filters['text']) {
//             return true;
//           }
//           return false;
//         }
//         if (filters['flat'] && element.type == Type.Flat) {
//           if (element.pricePerNight < filters['text']) {
//             return true;
//           }
//           return false;
//         }
//         if (filters['resort'] && element.type == Type.Resort) {
//           if (element.pricePerNight < filters['text']) {
//             return true;
//           }
//           return false;
//         }
//         return false;
//       }).toList();
//     });
//   }

//   void toggleWishlist(String id) {
//     var isFavr = false;
//     int index = favList.indexWhere((element) => element.id == id);
//     if (index >= 0) {
//       setState(() {
//         favList.removeAt(index);
//         isFavr = false;
//       });
//     } else {
//       setState(() {
//         favList.add(hotelData.firstWhere((element) => element.id == id));
//       });
//     }
//   }

//   //List<StayTypeData> dataList=hotelData
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/',
//       routes: {
//         '/': (ctx) => HomeScreenStay(this.toggleWishlist, this.favList,
//             this.filterList, this.filteredList),
//         '/WishList': (ctx) => WishList(this.favList, this.toggleWishlist),
//         '/Filters': (ctx) => FiltersScreen(),
//       },
//     );
//   }
// }

import './ELC Project/AddUserScreen.dart';
// import 'package:first_app/Shop_App/Auth.dart';
// import './Shop_App/Auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'pages/splash_page.dart';
import './ELC Project/Workers.dart';
import './ELC Project/flash.dart';
import './ELC Project/Homepage.dart';
import './ELC Project/ProfileScreen.dart';
import './ELC Project/homepage2.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Design',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        // home: SplashPage(),
        initialRoute: '/',
        routes: {
          'homepage2': (ctx) => HomePage2(),
          '/AddUserScreen': (ctx) => AddUserScreen(),
          '/': (ctx) => SplashPage(),
          '/Workers': (ctx) => Workers("electricion"),
          'HomePage': (ctx) => HomePage2(),
          // '/ProfileScreen': (ctx) => ProfileScreen()
        });
  }
}
