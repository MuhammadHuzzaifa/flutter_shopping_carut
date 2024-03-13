import 'package:flutter/material.dart';
import 'package:flutter_shopping_carut/cart_model.dart';
import 'package:flutter_shopping_carut/cart_provider.dart';
import 'package:flutter_shopping_carut/db_helper.dart';
import 'package:provider/provider.dart';

import 'package:badges/badges.dart' as badges;


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBHelper? dbHelper = DBHelper();
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Products',
          style: TextStyle(color: Colors.white, fontFamily: 'YourCustomFont', fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [

          Center(
            child: badges.Badge(
              badgeContent:Consumer<CartProvider>(
                builder: (context,value , child){
                  return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white));
                },

              ),
              //animationDuraton:Duration(milliseconds: 300),

              child: Icon(Icons.shopping_bag_outlined),
            ),
          ),


          SizedBox(width: 20.0)
        ],
      ),
      body:Column(
        children: [
          FutureBuilder(
              future: cart.getData(),
              builder: (context, AsyncSnapshot<List<Cart>> snapshot){
                if(snapshot.hasData){
                  return Expanded(
                      child:ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index)
                          {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Image(
                                          height: 100,
                                          width: 100,
                                          image: NetworkImage(snapshot.data![index].image.toString()),
                                        ),
                                        SizedBox(width:15),
                                        Expanded(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(snapshot.data![index].productName.toString(),
                                                      style:TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                                    ) ,
                                                    InkWell(
                                                        onTap: (){
                                                          dbHelper!.delete(snapshot.data![index].id!);
                                                          cart.removerCounter();
                                                          cart.removeTotalPrice(double.parse(snapshot.data![index].productPrice.toString()));

                                                        },
                                                        child: Icon(Icons.delete))
                                                  ],
                                                ),

                                                SizedBox(height: 5),
                                                Text(snapshot.data![index].unitTag.toString()+ "    Rs "+ snapshot.data![index].productPrice.toString(),
                                                  style:TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                                ),
                                                SizedBox(height: 5,),
                                                Align(
                                                  alignment: Alignment.centerRight,
                                                  child: InkWell(
                                                    onTap: (){


                                                    },
                                                    child: Container(
                                                      height: 30,
                                                      width: 90,
                                                      decoration: BoxDecoration(
                                                          color: Colors.blue,
                                                          borderRadius: BorderRadius.circular(10)
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                                          children:[

                                                            Icon(Icons.remove,color: Colors.white,),
                                                            Text(snapshot.data![index].quantity.toString(),style: TextStyle(color: Colors.white),),
                                                             InkWell(
                                                                 onTap: (){
                                                                   int quantity = snapshot.data![index].quantity!;
                                                                   int price= snapshot.data![index].intialPrice!;
                                                                   quantity++;
                                                                   int? newPrice= price* quantity;
                                                                   dbHelper!.updateQuantity(
                                                                     Cart(
                                                                         id: snapshot.data![index].id!,
                                                                         productId:snapshot.data![index].id!.toString(),
                                                                         productName: snapshot.data![index].productName!,
                                                                         productPrice: newPrice,
                                                                         intialPrice: snapshot.data![index].intialPrice!,
                                                                         quantity: quantity,
                                                                         unitTag: snapshot.data![index].unitTag.toString(),
                                                                         image: snapshot.data![index].image.toString())
                                                                   ).then((value) {
                                                                     newPrice= 0;
                                                                     quantity= 0;
                                                                     cart.addTotalPrice(double.parse( snapshot.data![index].intialPrice!.toString()));

                                                                   }).onError((error, stackTrace){
                                                                     print(error.toString());
                                                                   }
                                                                   );

                                                                 },
                                                                 child: Icon(Icons.add,color: Colors.white,))

                                                          ]
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )


                                              ],

                                            ))

                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                  );
                }
               return Text('data');
              }),
          Consumer<CartProvider>(builder: (context, value, child){
            return Visibility(
              visible:value.getTotalPrice().toStringAsFixed(2)== "0.00"? false: true ,
              child: Column(
                children: [
                  ReusableWidget(title: 'Sub total  ', value: r' RS  '+ value.getTotalPrice().toStringAsFixed(2),)
                ],
              ),
            );
          })
        ],
      ) ,
    );
  }
}

class ReusableWidget extends StatelessWidget {
  final String title, value;
  const ReusableWidget({required this.title,required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: Theme.of(context).textTheme.subtitle2,),
          Text(value.toString(),style: Theme.of(context).textTheme.subtitle2,)
        ],
      ),
    );
  }
}