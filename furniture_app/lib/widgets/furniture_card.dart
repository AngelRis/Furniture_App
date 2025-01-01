import 'package:flutter/material.dart';
import 'package:furniture_app/models/furniture.dart';
import 'package:furniture_app/providers/furniture_provider.dart';
import 'package:furniture_app/screens/details_screen.dart';
import 'package:provider/provider.dart';

class FurnitureCard extends StatelessWidget {
  final Furniture furniture;
  const FurnitureCard({super.key, required this.furniture});

  @override
  Widget build(BuildContext context) {
    final furnitureProvider=Provider.of<FurnitureProvider>(context);
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(3),
        enableFeedback: true,
        splashColor: Colors.transparent,
        onTap: () => {
        Navigator.push(
             context,
               MaterialPageRoute(builder: (context) =>  DetailsScreen(furniture: furniture))
        ),
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
            ],
          ),
          child: Column(
            children: [
              Expanded(child: Image.asset(furniture.imageUrl, fit: BoxFit.contain)),

              Container(
                padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space evenly
                  children: [

                    SizedBox(
                      width:80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            furniture.name,
                            style: const TextStyle(fontSize: 15.5, color: Colors.black54),
                              overflow: TextOverflow.ellipsis
                          ),
                          Text(
                            "${furniture.price} MKD",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black87, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    (furnitureProvider.favoriteFurniture.any((tmp)=>tmp.name==furniture.name))?
                    IconButton(
                      onPressed: () {
                        furnitureProvider.removeFromFavorites(furniture);
                      },
                      icon: const Icon(Icons.favorite, color: Colors.red) ,
                    ):
                    IconButton(
                      onPressed: () {
                        furnitureProvider.addToFavorites(furniture);
                      },
                      icon: const Icon(Icons.favorite_border, color: Colors.red)
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}