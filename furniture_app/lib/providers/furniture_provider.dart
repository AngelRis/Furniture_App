import 'package:flutter/material.dart';
import '../models/furniture.dart';

class FurnitureProvider with ChangeNotifier {
  List<Furniture> _furnitureList = [];
  List<Furniture> _favoriteFurniture = [];
  List<Furniture> _filteredFurnitureList  = [];

  List<Furniture> get favoriteFurniture => _favoriteFurniture;

  List<Furniture> get furnitureList => _filteredFurnitureList.isNotEmpty
      ? _filteredFurnitureList
      : _furnitureList;


  void addFurniture(Furniture furniture) {
    if(!_furnitureList.any((tmp)=>tmp.name==furniture.name)){
      _furnitureList.add(furniture);
      notifyListeners();
    }
  }

  void filterFurniture(String category) {
    if (category == 'All') {
      _filteredFurnitureList = [];
    } else {
      _filteredFurnitureList =
          _furnitureList.where((furniture) => furniture.category == category).toList();
    }
    notifyListeners();
  }

  void addToFavorites(Furniture furniture) {
    if (!_favoriteFurniture.any((tmp)=>tmp.name==furniture.name)) {
      _favoriteFurniture.add(furniture);
      notifyListeners();
    }
  }

  void removeFromFavorites(Furniture furniture) {
    _favoriteFurniture.remove(furniture);
    notifyListeners();
  }

  void generateFurniture() {
    _filteredFurnitureList=[];
    addFurniture(Furniture(name: 'Фотелја, Аспен', price: 14548, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture1.jpg', category: 'Chair',colors: ['0xFFAA6044','0xFF70867A','0xFF807C5F']));
    addFurniture(Furniture(name: 'Фотеља, Тундра', price: 12791, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture2.jpg', category: 'Chair',colors: ['0xFFAA6044','0xFF70867A','0xFF807C5F']));
    addFurniture(Furniture(name: 'Фотеља, Лиса', price: 18496, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture3.jpg', category: 'Chair',colors: ['0xFFAA6044','0xFF70867A','0xFF807C5F']));
    addFurniture(Furniture(name: 'Фотеља,Тенор', price: 12791, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture4.jpg', category: 'Chair',colors: ['0xFFAA6044','0xFF70867A','0xFF807C5F']));
    addFurniture(Furniture(name: 'Маса на развлекувње, ОРДОС', price: 112072, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture5.jpg', category: 'Table',colors: ['0xFFFFFFFF','0xFF6A5E53']));
    addFurniture(Furniture(name: 'Маса, Сахара 180x90', price: 103974, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture6.jpg', category: 'Table',colors: ['0xFFFFFFFF','0xFF6A5E53']));
    addFurniture(Furniture(name: 'Маса, Крос сјај', price: 13810, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture7.jpg', category: 'Table',colors: ['0xFFFFFFFF','0xFF6A5E53']));
    addFurniture(Furniture(name: 'Маса, Таро', price: 41125, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture8.jpg', category: 'Table',colors: ['0xFFFFFFFF','0xFF6A5E53']));
    addFurniture(Furniture(name: 'Тросед на развлекување', price: 23100, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture9.jpg', category: 'Sofa',colors: ['0xFF550C09','0xFF242424','0xFFB88F39']));
    addFurniture(Furniture(name: 'Тросед на развлекување, Вермонт', price: 21578, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture10.jpg', category: 'Sofa',colors: ['0xFF550C09','0xFF242424','0xFFB88F39']));
    addFurniture(Furniture(name: 'Тросед, Мелодиа', price: 55626, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture11.jpg', category: 'Sofa',colors: ['0xFF550C09','0xFF242424','0xFFB88F39']));
    addFurniture(Furniture(name: 'Тросед, Катаниа', price: 41256, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture12.jpg', category: 'Sofa',colors: ['0xFF550C09','0xFF242424','0xFFB88F39']));
    addFurniture(Furniture(name: 'Канцелариска маса, Трентон', price: 13676, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture13.jpg', category: 'Desk',colors: ['0xFFBCBDB2','0xFFB39677','0xFF636468']));
    addFurniture(Furniture(name: 'Канцелариска маса со додаток, Сенс', price: 31413, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture14.jpg', category: 'Desk',colors: ['0xFFBCBDB2','0xFFB39677','0xFF636468']));
    addFurniture(Furniture(name: 'Маси за пишување, Тинс', price: 6085, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture15.jpg', category: 'Desk',colors: ['0xFFBCBDB2','0xFFB39677','0xFF636468']));
    addFurniture(Furniture(name: 'Канцелариска маса подесива по висина', price: 40304, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture16.jpg', category: 'Desk',colors: ['0xFFBCBDB2','0xFFB39677','0xFF636468']));
    addFurniture(Furniture(name: 'Oрмар 4Д со фиоки, Јулија', price: 61511, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture17.jpg', category: 'Closet',colors: ['0xFFF8F9F7','0xFF1A689','0xFFDFD7C8']));
    addFurniture(Furniture(name: 'Oрмар 3 врати со огледало, Цвита', price: 26656, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture18.jpg', category: 'Closet',colors: ['0xFFF8F9F7','0xFF1A689','0xFFDFD7C8']));
    addFurniture(Furniture(name: 'Ормар со 2 врати и 2 фиоки, Паола', price: 15285, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture19.jpg', category: 'Closet',colors: ['0xFFF8F9F7','0xFF1A689','0xFFDFD7C8']));
    addFurniture(Furniture(name: 'Ормар лизгачки 220х220, Паола', price: 34923, description: 'Овој мебел комбинира современ дизајн и издржливи материјали за максимална удобност и стил. Совршен за секој простор, обезбедува практичност и елеганција, додека е лесен за одржување и долготрен. ', imageUrl: 'assets/images/furniture20.jpg', category: 'Closet',colors: ['0xFFF8F9F7','0xFF1A689','0xFFDFD7C8']));

    notifyListeners();
  }

}