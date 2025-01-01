import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/bottom_nav_bar.dart';
import 'package:furniture_app/widgets/furniture_card.dart';
import 'package:provider/provider.dart';
import '../providers/furniture_provider.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final furnitureList = Provider.of<FurnitureProvider>(context).favoriteFurniture;

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor:Colors.transparent ,
        title: Padding(
          padding: const EdgeInsets.only(right: 48),
          child: Center(child: Text("Favorites")),
        ),
        leading:  IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back,size: 30,) ,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 20.0,top: 10.0,right: 20.0,bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 17, 0, 17),
              child: Text(
                'My Favorite\nFurniture',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF506074),
                ),
              ),
            ),

            const SizedBox(height: 20.0),
            (furnitureList.isEmpty)?
            Center(child: Padding(
              padding: EdgeInsets.only(top: 180),
              child: const Text("No favorites..",style: TextStyle(fontSize: 24,color:Colors.black87,fontStyle: FontStyle.italic),),
            )):
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 0.6,
                physics: const BouncingScrollPhysics(),
                children: furnitureList.map((furniture) => FurnitureCard(furniture: furniture)).toList(),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
