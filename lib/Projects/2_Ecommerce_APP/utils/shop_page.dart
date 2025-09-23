import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/components/shoe_tile.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/models/cart.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/models/shoe.dart';

class ShopPage extends StatefulWidget {
  final Function() goToCartPage;
  const ShopPage({super.key, required this.goToCartPage});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert User:
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        backgroundColor: Colors.grey[100],
        title: Row(
          children: const [
            Icon(Icons.check_circle, color: Colors.green, size: 28),
            SizedBox(width: 8),
            Text(
              "Success",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: const Text(
          "Your shoe has been added to the cart ✅",
          style: TextStyle(fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "Close",
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              Navigator.pop(context); // close dialog
              widget.goToCartPage();
            },
            child: const Text("Go to Cart", style: TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
            backgroundColor: Colors.grey[300],
            body: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(12.0),
                  margin: EdgeInsets.only(left: 20, right: 20, top: 8),
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Search for anything", style: TextStyle(color: Colors.grey),),
                      Icon(Icons.search, color: Colors.grey,)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text(
                    "everyone flies.. some fly longer than others",
                    style: TextStyle(
                        color: Colors.grey[600],
                        fontFamily: 'Roboto'
                    ),
                  ),
                ),
                //hot picks
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Hot Picks 🔥",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22
                        ),
                      ),
                      Text(
                        "See all",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blue
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: value.getShoeList().length,
                        itemBuilder: (context, index) {
                          Shoe shoe = value.getShoeList()[index]; // get shoe from provider
                          return ShoeTile(
                              shoe: shoe,
                            onTap: () => addShoeToCart(shoe),
                          );
                        }
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 20, left: 20),
                  child: Divider(
                    color: Colors.white,
                  ),
                )
              ],
            )
        ),
    );
  }
}
