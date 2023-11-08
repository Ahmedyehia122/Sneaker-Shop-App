import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershopapp/models/cart.dart';
import 'package:sneakershopapp/models/shoe.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  //remove item from cart
  void removeItemFromCart() {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(widget.shoe.imagePath),
      title: Text(widget.shoe.name),
      subtitle: Text(widget.shoe.price),
      trailing: IconButton(
        onPressed: removeItemFromCart,
        icon: const Icon(Icons.delete),
      ),
    );
  }
}
