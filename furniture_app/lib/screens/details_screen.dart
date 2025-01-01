import 'package:flutter/material.dart';
import 'package:furniture_app/models/furniture.dart';
import 'package:furniture_app/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import '../providers/furniture_provider.dart';

class DetailsScreen extends StatelessWidget {
  final Furniture furniture;

  DetailsScreen({required this.furniture});

  @override
  Widget build(BuildContext context) {
    final furnitureProvider=Provider.of<FurnitureProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 30, color: Colors.black54),
        ),
        actions: [
          (furnitureProvider.favoriteFurniture.any((tmp)=>tmp.name==furniture.name))?
          IconButton(
            onPressed: () {
              furnitureProvider.removeFromFavorites(furniture);
            },
            icon: const Icon(Icons.favorite,size: 32, color: Colors.red) ,
          ):
          IconButton(
              onPressed: () {
                furnitureProvider.addToFavorites(furniture);
              },
              icon: const Icon(Icons.favorite_border, size: 32, color: Colors.red)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Furniture image
            Padding(
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                furniture.imageUrl,
                fit: BoxFit.contain,
                height: 300,
                alignment: Alignment.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: furniture.colors.map((colorString) {
                    final color = Color(int.parse(colorString));
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black54, width: 1),
                        ),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: color,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      furniture.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    furniture.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Text(
                      "${furniture.price} MKD",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Color(0xFFAC4C1C),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
