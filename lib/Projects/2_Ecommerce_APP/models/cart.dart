import 'package:flutter/cupertino.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/models/shoe.dart';

class Cart extends ChangeNotifier {

  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: "Air Force",
        price: "240",
        imagePath: "lib/Projects/2_Ecommerce_APP/assets/airForce.png",
        description: "A timeless classic with a clean look and versatile style, perfect for any outfit."
    ),
    Shoe(
        name: "Air Jordan",
        price: "269.99",
        imagePath: "lib/Projects/2_Ecommerce_APP/assets/airJordan.png",
        description: "Iconic performance sneakers with premium comfort, built for both style and the game."
    ),
    Shoe(
        name: "Butterfly Feminine Nike",
        price: "232.99",
        imagePath: "lib/Projects/2_Ecommerce_APP/assets/butterfly_shoes.png",
        description: "A unique and stylish design with a touch of elegance, combining sport and fashion."
    ),
    Shoe(
        name: "Nike Air Monarch IV",
        price: "233.49",
        imagePath: "lib/Projects/2_Ecommerce_APP/assets/monarchNike.png",
        description: "Durable and supportive sneakers made for all-day comfort and everyday wear."
    ),
  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  //add items to the cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //removing items to the cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }

}