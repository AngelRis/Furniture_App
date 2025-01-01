import 'package:flutter/material.dart';
import 'package:furniture_app/widgets/bottom_nav_bar.dart';
import 'package:furniture_app/widgets/discount_card.dart';
import 'package:furniture_app/widgets/furniture_card.dart';
import 'package:provider/provider.dart';
import '../providers/furniture_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _selectedIndex=0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final furnitureProvider =
      Provider.of<FurnitureProvider>(context, listen: false);

      furnitureProvider.generateFurniture();
    });
  }

  @override
  Widget build(BuildContext context) {
    var furnitureList = Provider.of<FurnitureProvider>(context).furnitureList;

    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.select_all, 'label': 'All'},
      {'icon': Icons.chair_outlined, 'label': 'Chair'},
      {'icon': Icons.table_bar, 'label': 'Table'},
      {'icon': Icons.weekend_sharp, 'label': 'Sofa'},
      {'icon': Icons.desk, 'label': 'Desk'},
      {'icon': Icons.curtains_closed_rounded, 'label': 'Closet'},
    ];

    return Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Container(
        padding: const EdgeInsets.only(left: 20.0,top: 20.0,right: 20.0,bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
              child: Text(
                'Explore Furniture\nCollection',
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF506074),
                ),
              ),
            ),
            DiscountCardWidget(
              title: "30% OFF",
              description: "Until February 25",
              imageUrl: 'assets/images/banner_chair_img.png',
            ),
            const SizedBox(height: 20.0),
        Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: categories.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> category = entry.value;

                bool isSelected = _selectedIndex == index;

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                          final furnitureProvider =
                          Provider.of<FurnitureProvider>(context, listen: false);
                          furnitureProvider.filterFurniture(category['label']);
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: isSelected ? Color(0xFF164432) : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(30.0),
                          border: Border.all(
                            color: isSelected ? Color(0xFF164432) : Colors.grey.shade400,
                          ),
                        ),
                        child: Icon(
                          category['icon'],
                          color: isSelected ? Colors.white : Colors.black,
                          size: 23.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      category['label'],
                      style: TextStyle(
                        color: isSelected ? Color(0xFF164432) : Colors.black,
                        fontSize: 12.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
            const SizedBox(height: 20.0),
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
