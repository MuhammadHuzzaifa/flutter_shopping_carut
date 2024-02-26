import 'package:flutter/material.dart';
class ScreenDashboard extends StatefulWidget {
  const ScreenDashboard({super.key});

  @override
  State<ScreenDashboard> createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  List<String> productName = ['Mango' , 'Orange' , 'Grapes' , 'Banana' , 'Chery' , 'Peach','Mixed Fruit Basket',] ;
  List<String> productUnit = ['KG' , 'Dozen' , 'KG' , 'Dozen' , 'KG' , 'KG','KG',] ;
  List<int> productPrice = [100, 200 , 250 , 150 , 540, 360 ,876 ] ;
  List<String> productImage = [
    'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg' ,
    'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg' ,
    'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg' ,
    'https://media.istockphoto.com/photos/banana-picture-id1184345169?s=612x612' ,
    'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612' ,
    'https://media.istockphoto.com/photos/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white-picture-id1151868959?s=612x612' ,
    'https://media.istockphoto.com/photos/fruit-background-picture-id529664572?s=612x612' ,
  ] ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product list"),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        actions: [
          Center(
         child: Badge(

           textColor: Colors.white,
            smallSize: 15,
           child:Icon(Icons.shopping_bag_outlined),
          ),),
          SizedBox(width: 25.0)

        ],
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
    );
  }
}
