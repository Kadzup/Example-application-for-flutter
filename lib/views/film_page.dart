import 'package:flutter/material.dart';

import 'package:test_app/models/film.dart';

class FilmPage extends StatelessWidget {
  final Film film;

  const FilmPage({
    Key? key,
    required this.film,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${film.title} - ${film.year} р.")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 250.0,
                  width: 165.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(film.imageURL),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      film.title,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      width: 500,
                      child: Text(film.description),
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      "Рік випуску: ${film.year}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      "Режисер: ${film.director}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    if (film.isReleased)
                      const Text(
                        "Фільм вже вийшов",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
