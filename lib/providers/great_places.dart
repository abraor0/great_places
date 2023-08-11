import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/helpers/db_helper.dart';
import 'package:great_places/models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String title, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: title,
      location: null,
      image: pickedImage,
    );
    _items.add(newPlace);
    notifyListeners();
    DbHelper.insert('user_places', {
      'title': newPlace.title,
      'image': newPlace.image.path,
      'id': newPlace.id,
    });
  }

  Future<void> fetchAndSetPlaces() async {
    final data = await DbHelper.getData('user_places');
    _items = data
        .map((e) => Place(
            id: e['id'],
            title: e['title'],
            location: null,
            image: File(e['image'])))
        .toList();
    notifyListeners();
  }
}
