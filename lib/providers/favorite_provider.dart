import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String>? fav_list = ["0"];

  void addFavorite(String id) {
    fav_list?.add(id);
    notifyListeners();
  }

  void removeFavorite(String id) {
    fav_list?.remove(id);
    notifyListeners();
  }

  bool isFavorite(String id) {
    if (fav_list == null) {
      return false;
    }

    return fav_list!.contains(id);
  }
}
