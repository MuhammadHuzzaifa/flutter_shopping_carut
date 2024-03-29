
import 'package:flutter_shopping_carut/cart_provider.dart';
import 'package:flutter_shopping_carut/cart_screen.dart';
import 'package:flutter_shopping_carut/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import 'fruit_list.dart';
import 'vegetable _list.dart';


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

             InkWell(
               onTap: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=> CartScreen()));
               },
               child: Center(
                child:badges.Badge(
                  badgeContent:Consumer<CartProvider>(
                         builder: (context,value , child){
                           return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white));
                   },
               
                     ),
                   //animationDuraton:Duration(milliseconds: 300),
               
                  child: Icon(Icons.shopping_bag_outlined),
                ),
                           ),
             ),


          SizedBox(width: 20.0)
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


                foregroundColor: Colors.white, backgroundColor: Colors.deepPurpleAccent,
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
                foregroundColor: Colors.white, backgroundColor: Colors.deepPurpleAccent,
              ),
            ),



          ],
        ),

      ),

    );
  }
}



