import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/bottom_nav_bar.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(right: 48),
          child: Center(child: Text("About Us")),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black54),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Furniture image
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.contain,
                height: 300,
                alignment: Alignment.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                      "About us",
                      style: const TextStyle(color:Color(0xFF506074),fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome to Angel Furniture! Founded in 2002, we began as a small family business with a passion for creating high-quality, stylish, and affordable furniture. Over the years, we have grown into a trusted brand, known for transforming spaces into elegant and comfortable homes. With a rich history of craftsmanship and dedication to customer satisfaction, we continue to offer a wide range of products to suit every taste and need. Your dream furniture is just a step away!",
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.redAccent),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Slavko Lazareski 34, Kicevo",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.phone, color: Colors.green),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "+389 71 226 773",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
