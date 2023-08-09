import 'package:flutter/material.dart';
import 'package:great_places/screens/new_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(NewPlaceScreen.routeName),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
