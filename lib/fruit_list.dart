import 'package:flutter/material.dart';
class FruitList extends StatefulWidget {
  const FruitList({super.key});

  @override
  State<FruitList> createState() => _FruitListState();
}

class _FruitListState extends State<FruitList> {
  List<String> productName = ['Mango' , 'Orange' , 'Grapes' , 'Banana' , 'Chery' , 'Peach','Mixed Fruit Basket','apple',] ;
  List<String> productUnit = ['KG' , 'Dozen' , 'KG' , 'Dozen' , 'KG' , 'KG','KG','KG',] ;
  List<int> productPrice = [100, 200 , 250 , 150 , 540, 360 ,876,250 ] ;
  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg' ,
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg' ,
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg' ,
    'https://image.shutterstock.com/image-photo/bnana-isolated-on-white-background-600w-96162077.jpg' ,
    'https://image.shutterstock.com/image-photo/Chery-isolated-on-white-background-600w-1797601963.jpg' ,
    'https://image.shutterstock.com/image-photo/Peach-isolated-on-white-background-600w-769949461.jpg' ,
    'https://image.shutterstock.com/image-photo/Mixed-fruit-isolated-on-white-background-600w-254714575.jpg' ,
    'https://image.shutterstock.com/image-photo/apple-isolated-on-white-background-600w-158989157.jpg',
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fruit List",
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
