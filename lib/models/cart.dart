import 'package:flutter/material.dart';
import 'package:sneakershopapp/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom FREAK',
        price: '230',
        imagePath: 'lib/images/shose1.jpg',
        description:
            'The Nike Zoom Air Force is a cutting-edge athletic shoe that combines style and performance seamlessly'),
    Shoe(
        name: 'Air Jordans',
        price: '250',
        imagePath: 'lib/images/shose2.jpg',
        description:
            'The Nike Air Jordans are iconic athletic shoes that epitomize style and basketball prowess'),
    Shoe(
        name: 'Kd trey',
        price: '210',
        imagePath: 'lib/images/shose3.jpg',
        description:
            'The Nike T KD Trey 5 is a versatile basketball shoe that combines style and performance'),
    Shoe(
        name: 'Kyrie 6',
        price: '120',
        imagePath: 'lib/images/shose4.jpg',
        description:
            'The Nike Kyrie 6 is a cutting-edge basketball shoe that combines style and performance effortlessly'),
  ];

  // list of items in user cart
  List<Shoe> userCart = [];

  // get lis of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
