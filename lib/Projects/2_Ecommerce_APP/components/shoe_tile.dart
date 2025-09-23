import 'package:flutter/material.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/models/shoe.dart';

class ShoeTile extends StatelessWidget {
  final Shoe shoe;
  final Function()? onTap;

  const ShoeTile({super.key, required this.shoe, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //the shoe image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              shoe.imagePath,
              height: 130, // fixed height
              width: double.infinity,
              fit: BoxFit.contain, // keeps proportions without cropping
            ),
          ),

          //the shoe description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Text(
              shoe.description[0].toUpperCase() + shoe.description.substring(1),
              style: TextStyle(color: Colors.grey[600]),
              maxLines: 2, // show only 2 lines
              overflow: TextOverflow.ellipsis, // adds "..." at the end
              textAlign: TextAlign.center, // optional, looks nicer
            ),
          ),

          //price + details
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 120, // constrain the width so it doesn’t overflow into the add button
                      child: Text(
                        shoe.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        maxLines: 1, // only 1 line
                        overflow: TextOverflow.ellipsis, // show "..." if too long
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text(
                      '\$' + shoe.price,
                      style: TextStyle(
                        color: Colors.grey
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: onTap ,
                  child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)
                        )
                      ),
                      child: Icon(Icons.add,color: Colors.white,)
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
