import 'package:flutter/material.dart';
import 'package:test_app/models/film.dart';
import 'package:test_app/views/create_film_page.dart';
import 'package:test_app/views/film_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Film> films = [
    Film(
      title: "The Terminator",
      description:
          "The Terminator is a formidable robotic assassin and soldier, designed by the military supercomputer Skynet for infiltration and combat duty, towards the ultimate goal of exterminating the Human Resistance.",
      imageURL:
          "https://upload.wikimedia.org/wikipedia/ru/c/ca/Terminator_poster.jpg",
      year: 1984,
      director: "James Cameron",
      isReleased: true,
    ),
    Film(
      title: "Titanic",
      description:
          "The movie is about the 1912 sinking of the RMS Titanic. It stars Kate Winslet and Leonardo DiCaprio. The two play characters who are of different social classes. They fall in love after meeting aboard the ship, but it was not good for a rich girl to fall in love with a poor boy in 1912.",
      imageURL:
          "https://upload.wikimedia.org/wikipedia/en/1/18/Titanic_%281997_film%29_poster.png",
      year: 1997,
      director: "James Cameron",
      isReleased: true,
    ),
    Film(
      title: "Pulp Fiction",
      description:
          "Pulp Fiction is a collection of stories, which, although interconnected, can get a bit confusing because they're shown out of order. Tarantino evidently took the advice of legendary film director Jean-Luc Godard, one of his idols, who said that \"A story should have a beginning, a middle and an end, but not necessarily in that order.\" But not to worry, Shmoop will take you through all the action chronologically…or as close to it as we can get.",
      imageURL:
          "https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_FMjpg_UY576_.jpg",
      year: 1994,
      director: "Quentin Tarantino",
      isReleased: true,
    ),
    Film(
      title: "Avatar: The Way of Water",
      description:
          "Avatar: The Way of Water is an upcoming American epic science-fiction film directed by James Cameron and produced by 20th Century Studios. It is the second film in Cameron's Avatar franchise, following Avatar (2009)",
      imageURL:
          "https://upload.wikimedia.org/wikipedia/en/5/54/Avatar_The_Way_of_Water_poster.jpg",
      year: 2022,
      director: "James Cameron",
      isReleased: false,
    ),
  ];

  void openFilm(Film film) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return FilmPage(film: film);
        },
      ),
    );
  }

  void createFilm() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return CreateFilmPage(
            callback: (Film? newFilm) {
              if (newFilm == null) return;

              films.add(newFilm);
              setState(() {});
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) {
          final film = films.elementAt(index);

          return ListTile(
            leading: const Icon(Icons.movie_creation_outlined),
            title: Text(film.title),
            subtitle: Text("${film.year} р."),
            onTap: () => openFilm(film),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createFilm,
        tooltip: "Додати фільм",
        child: const Icon(Icons.add),
      ),
    );
  }
}
