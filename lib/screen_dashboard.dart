import 'package:flutter_shopping_carut/vegetable _list.dart';
import 'package:flutter/material.dart';

import 'fruit_list.dart';


class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({Key? key}) : super(key: key);

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Dashboard',
          style: TextStyle(color: Colors.white, fontFamily: 'YourCustomFont', fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [
          Center(
            child: Badge(
              backgroundColor: Colors.deepOrange,

              textColor: Colors.white,
              smallSize: 8,
              child:Icon(Icons.shopping_bag_outlined,
              color: Colors.white,),
            ),),
          SizedBox(width: 25.0)

        ],
      ),
      body: Container(
        color: Colors.black12,
        padding: EdgeInsets.all(16.0),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => const FruitList()));
              },
              icon: Icon(Icons.list),
              label: Text('  Fruit   Dashboard',
                style: TextStyle(color: Colors.white, fontFamily: 'YourCustomFont', fontSize: 24.0, fontWeight: FontWeight.bold),),
              style: ElevatedButton.styleFrom(


                primary: Colors.deepPurpleAccent,
                onPrimary: Colors.white,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => const VagetableList()));
              },
              icon: Icon(Icons.list_sharp),
              label: Text(' vegetable    Dashboard',
                  style: TextStyle(color: Colors.white, fontFamily: 'YourCustomFont', fontSize: 24.0, fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurpleAccent,
                onPrimary: Colors.white,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
