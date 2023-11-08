import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakershopapp/components/shoe_tile.dart';
import 'package:sneakershopapp/models/cart.dart';
import 'package:sneakershopapp/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user , shoe successfully added
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Color.fromARGB(255, 33, 32, 32),
        title: Text(
          'Successfully added',
          style: TextStyle(color: Colors.white),
        ),
        content: Text(
          'Check your cart',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) {
        return Column(
          children: [
            //search bar
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search'),
                  Icon(
                    Icons.search,
                    color: Colors.grey,
                  )
                ],
              ),
            )

            //message
            ,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Text(
                'everyone flies ...some fly longer than others',
                style: TextStyle(color: Colors.grey[600]),
              ),
            )

            //hot picks
            ,
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Hot Picks 🔥',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //list of shoes for sale
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: value.getShoeList().length,
                itemBuilder: (BuildContext context, int index) {
                  //get a shoe from shoe list
                  Shoe shoe = value.getShoeList()[index];
                  //return the shoe
                  return ShoeTile(
                    onTap: () => addShoeToCart(shoe),
                    shoe: shoe,
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 25, left: 25),
              child: Divider(
                color: Colors.white,
              ),
            )
          ],
        );
      },
    );
  }
}
