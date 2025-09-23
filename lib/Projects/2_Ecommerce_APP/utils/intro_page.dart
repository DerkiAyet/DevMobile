import 'package:flutter/material.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "lib/Projects/2_Ecommerce_APP/assets/nike_logo.png",
                  height: 240,
                ),
              ),
              SizedBox(height: 40),
              const Text(
                "Just Do It",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 24),
              const Text(
                "Brand new sneakers and custom kicks made with premium quality",
                style: TextStyle(fontSize: 16, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              MouseRegion(
                cursor: SystemMouseCursors.click, // 👈 this is like CSS cursor: pointer
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.grey[900], borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(20.0),
                    child: const Text(
                      "Shop Now",
                      style: TextStyle(color: Colors.white, fontSize: 19),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
