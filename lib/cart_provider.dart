import 'package:flutter/cupertino.dart';
import 'package:flutter_shopping_carut/cart_model.dart';
import 'package:flutter_shopping_carut/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{

  DBHelper db = DBHelper();
  int _counter=0;
  int get counter=> _counter;

  double _totalPrice=0.0;
  double get totalPricer=> _totalPrice;

  late Future<List<Cart>>_cart;
  Future<List<Cart>> get cart => _cart;

  Future<List<Cart>>getData () async{
    _cart = db.getCartList();
    return _cart;
  }

  void _setprefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.setInt('cart_item', _counter);
    prefs.setDouble('total_price', _totalPrice);
    notifyListeners();

  }

  void _getprefItems()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _counter=prefs.getInt('cart_item') ?? 0;
    _totalPrice=prefs.getDouble('total_price')?? 0.0;
    notifyListeners();

  }

  void addTotalPrice (double productPrice){
    _totalPrice= _totalPrice+productPrice;
    _setprefItems();
    notifyListeners();
  }

  void removeTotalPrice (double productPrice){
    _totalPrice= _totalPrice - productPrice;
    _setprefItems();
    notifyListeners();
  }

  double getTotalPrice (){
    _getprefItems();
    return _totalPrice;
  }

  void addCounter (){
    _counter++;
    _setprefItems();
    notifyListeners();
  }

  void removerCounter (){
    _counter--;
    _setprefItems();
    notifyListeners();
  }

  int getCounter (){
    _getprefItems();
   return _counter;
  }
}