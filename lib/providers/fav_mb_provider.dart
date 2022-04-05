import 'package:flutter/material.dart';
import 'package:plypicker_app/models/modular_bathroom.dart';

class FavModularBathroomsProvider extends ChangeNotifier {
  final List<ModularBathroom> favModularBathroomList = [];

  List<ModularBathroom> get favMBList => favModularBathroomList;

  void addItem(ModularBathroom itemAdded) {
    favModularBathroomList.add(itemAdded);
    notifyListeners();
  }

  void removeItem(ModularBathroom itemRemoved) {
    favModularBathroomList.remove(itemRemoved);
    notifyListeners();
  }
}
