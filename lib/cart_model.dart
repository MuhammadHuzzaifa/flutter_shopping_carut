import 'package:flutter/material.dart';

class Cart{

  late final int? id;
  final String? productId;
  final String? productName;
  final int? intialPrice ;
  final int?  productPrice;
  final int?   quantity ;
  final String? unitTag;
  final String? image;


  Cart({
   required this.id,
   required this.productId,
   required this.productName,
   required this.productPrice,
   required this.intialPrice,
   required this.quantity,
   required this.unitTag,
   required this.image
});

  Cart.fromMap(Map<dynamic,dynamic> res)
  : id =res['id'],
  productId = res["productId"],
  productName = res["productName"],
  intialPrice = res ["intialPrirce"],
  productPrice = res["productPrice"],
  quantity = res ["quantity"],
  unitTag = res["unitTag"],
  image = res["image"];

  Map<String,Object?> toMap(){
    return{
      'id': id,
      'productId':productId,
      'productName':productName,
      'initialPrice': intialPrice,
      'productPrice': productPrice,
      'quantity': quantity,
      'unitTag': unitTag,
      'image': image,
    };
  }

}