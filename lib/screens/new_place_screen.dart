import 'package:flutter/material.dart';
import 'package:great_places/widgets/image_input.dart';

class NewPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  const NewPlaceScreen({super.key});

  @override
  State<NewPlaceScreen> createState() => _NewPlaceScreenState();
}

class _NewPlaceScreenState extends State<NewPlaceScreen> {
  final _titleController = TextEditingController();

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
                ImageInput(),
              ],
            ),
          )),
        ),
        ElevatedButton.icon(
          onPressed: () {},
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
