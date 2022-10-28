import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:test_app/models/film.dart';

class CreateFilmPage extends StatefulWidget {
  final void Function(Film?) callback;

  const CreateFilmPage({
    Key? key,
    required this.callback,
  }) : super(key: key);

  @override
  State<CreateFilmPage> createState() => _CreateFilmPageState();
}

class _CreateFilmPageState extends State<CreateFilmPage> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final imageURLController = TextEditingController();
  final yearController = TextEditingController();
  final directorController = TextEditingController();

  bool isReleased = false;

  void createFilm() {
    final title = titleController.text.trim();
    final description = descriptionController.text.trim();
    final imageURL = imageURLController.text.trim();
    final year = int.parse(yearController.text.trim());
    final director = directorController.text.trim();

    widget.callback(
      Film(
        title: title,
        description: description,
        imageURL: imageURL,
        year: year,
        director: director,
        isReleased: isReleased,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Створення запису")),
      body: Center(
        child: SizedBox(
          width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(hintText: "Назва"),
              ),
              TextField(
                controller: descriptionController,
                maxLines: 5,
                decoration: const InputDecoration(hintText: "Опис"),
              ),
              TextField(
                controller: imageURLController,
                decoration:
                    const InputDecoration(hintText: "Посилання на зображення"),
              ),
              TextField(
                controller: yearController,
                keyboardType: TextInputType.number,
                maxLength: 4,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(hintText: "Рік випуску"),
              ),
              TextField(
                controller: directorController,
                decoration: const InputDecoration(hintText: "Режисер"),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Checkbox(
                    value: isReleased,
                    onChanged: (bool? value) {
                      if (value == null) return;

                      isReleased = value;

                      setState(() {});
                    },
                  ),
                  const Text("Фільм вже вийшов"),
                ],
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: createFilm,
                child: const Text("Створити запис"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
