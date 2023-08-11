import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/screens/new_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(NewPlaceScreen.routeName),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false)
            .fetchAndSetPlaces(),
        builder: (context, snapshot) =>
            snapshot.connectionState == ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<GreatPlaces>(
                    builder: (context, greatPlaces, ch) {
                      if (greatPlaces.items.isEmpty) {
                        return ch!;
                      }
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                                backgroundImage:
                                    FileImage(greatPlaces.items[index].image)),
                            title: Text(greatPlaces.items[index].title),
                            onTap: () {},
                          );
                        },
                        itemCount: greatPlaces.items.length,
                      );
                    },
                    child: const Center(
                      child: Text('No place added yet.'),
                    ),
                  ),
      ),
    );
  }
}
