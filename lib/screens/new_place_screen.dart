import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/providers/great_places.dart';
import 'package:great_places/widgets/image_input.dart';
import 'package:great_places/widgets/location_input.dart';
import 'package:provider/provider.dart';

class NewPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  const NewPlaceScreen({super.key});

  @override
  State<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends State<NewPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;

  void _selectImage(File image) {
    _pickedImage = image;
  }

  void _savePlace() {
    if (_titleController.text.trim().isEmpty || _pickedImage == null) {
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  decoration: const InputDecoration(label: Text('Title')),
                  controller: _titleController,
                ),
                const SizedBox(
                  height: 16,
                ),
                ImageInput(_selectImage),
                const SizedBox(
                  height: 16,
                ),
                LocationInput()
              ],
            ),
          )),
        ),
        ElevatedButton.icon(
          onPressed: _savePlace,
          icon: Icon(Icons.add),
          label: Text('Add place'),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: MaterialStateProperty.all(
                Theme.of(context).colorScheme.secondary),
          ),
        )
      ]),
    );
  }
}
