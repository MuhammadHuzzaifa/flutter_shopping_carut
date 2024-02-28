import 'package:flutter/material.dart';
class VagetableList extends StatefulWidget {
  const VagetableList({super.key});

  @override
  State<VagetableList> createState() => _VagetableListState();
}

class _VagetableListState extends State<VagetableList> {
  List<String> productName = ['Tomato' , 'Ptato' , 'onion' , 'Carrot' , 'Lady Finger' , 'Salad Leaf','Fresh Cucmbers','Bell Paper',] ;
  List<String> productUnit = ['KG' , 'Dozen' , 'KG' , 'Dozen' , 'KG' , 'KG','KG','KG',] ;
  List<int> productPrice = [100, 200 , 250 , 150 , 540, 360 ,876,250 ] ;
  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/tomato-isolated-on-white-background-600w-1020502231.jpg' ,
    'https://image.shutterstock.com/image-photo/ptato-isolated-on-white-background-600w-89581462.jpg' ,
    'https://image.shutterstock.com/image-photo/onion-isolated-on-white-background-600w-129368951.jpg' ,
    'https://image.shutterstock.com/image-photo/carrot-isolated-on-white-background-600w-481776079.jpg' ,
    'https://image.shutterstock.com/image-photo/lady_finger-isolated-on-white-background-600w-348982127.jpg' ,
    'https://image.shutterstock.com/image-photo/salad_leaf-isolated-on-white-background-600w-343381544.jpg' ,
    'https://image.shutterstock.com/image-photo/cucmbers-isolated-on-white-background-600w-136354208.jpg' ,
    'https://image.shutterstock.com/image-photo/bell_paper-isolated-on-white-background-600w-726224167.jpg',
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vegetable  List",
          style: TextStyle(color: Colors.white, fontFamily: 'YourCustomFont', fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: productName.length,
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
                                image: NetworkImage(productImage[index].toString() + productPrice[index].toString()),
                              ),
                              SizedBox(width:15),
                              Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(productName[index].toString(),
                                        style:TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                      ) ,
                                      SizedBox(height: 5),
                                      Text(productUnit[index].toString()+ "    Rs "+ productPrice[index].toString(),
                                        style:TextStyle(fontSize: 16,fontWeight: FontWeight.w500),
                                      ),
                                      SizedBox(height: 5,),
                                      Align(
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          height: 30,
                                          width: 90,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child: Center(
                                            child: Text('Add to cart',style: TextStyle(color: Colors.white),),
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
          )
        ],
      ),
   backgroundColor: Colors.deepOrange,
    );
  }
}
