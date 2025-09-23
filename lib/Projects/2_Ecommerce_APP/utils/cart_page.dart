import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/components/cart_item.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/models/cart.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) =>
            Scaffold(
              backgroundColor: Colors.grey[300],
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "My Cart",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: value.getUserCart().isEmpty
                          ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                            const SizedBox(height: 20),
                            const Text(
                              "Your cart is empty 😔",
                              style: TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                          : ListView.builder(
                        itemCount: value.getUserCart().length,
                        itemBuilder: (context, index) {
                          Shoe shoe = value.getUserCart()[index];
                          return CartItem(shoe: shoe);
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
    );
  }
}
