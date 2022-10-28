class Film {
  String title;
  String description;
  String imageURL;

  int year;
  String director;

  bool isReleased;

  Film({
    required this.title,
    required this.description,
    required this.imageURL,
    required this.year,
    required this.director,
    required this.isReleased,
  });
}
