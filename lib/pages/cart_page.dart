import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershopapp/components/cart_item.dart';
import 'package:sneakershopapp/models/cart.dart';
import 'package:sneakershopapp/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //heading
              const Text(
                'My CArt',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.getUserCart().length,
                  itemBuilder: (BuildContext context, int index) {
                    //get individual shoe
                    Shoe individualShoe = value.getUserCart()[index];
                    //return cart item
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CartItem(
                        shoe: individualShoe,
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
