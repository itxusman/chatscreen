class Trend {
  final String image, title, creator;

  Trend({
    required this.image,
    required this.title,
    required this.creator,
  });
}

List<Trend> trends = [
  Trend(image: "assets/dsa-book-1-638.webp", title: "Data structure and algorithms", creator: "Narasimha Karumanchi"),
  Trend(image: "assets/big0764119982.jpg", title: "Calculus", creator: "Michael Spivak."),
  Trend(image: "assets/AI-World.webp", title: "Artificial intelligence ", creator: " Dr. Lee "),
];