class Movie {
  String imdbTitleId;
  String title;
  String year;
  List<String> genre;
  Country country;
  List<String> language;
  String director;
  List<String> writer;
  String productionCompany;
  List<String> actors;
  String description;
  String avgVote;
  String votes;
  String budget;
  String metascore;
  String reviewsFromUsers;
  String reviewsFromCritics;

  Movie({
    this.imdbTitleId,
    this.title,
    this.year,
    this.genre,
    this.country,
    this.language,
    this.director,
    this.writer,
    this.productionCompany,
    this.actors,
    this.description,
    this.avgVote,
    this.votes,
    this.budget,
    this.metascore,
    this.reviewsFromUsers,
    this.reviewsFromCritics,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        imdbTitleId: json["imdb_title_id"],
        title: json["title"],
        year: json["year"],
        genre: List<String>.from(json["genre"].map((x) => x)),
        country: countryValues.map[json["country"]],
        language: List<String>.from(json["language"].map((x) => x)),
        director: json["director"],
        writer: List<String>.from(json["writer"].map((x) => x)),
        productionCompany: json["production_company"],
        actors: List<String>.from(json["actors"].map((x) => x)),
        description: json["description"],
        avgVote: json["avg_vote"],
        votes: json["votes"],
        budget: json["budget"] == null ? null : json["budget"],
        metascore: json["metascore"] == null ? null : json["metascore"],
        reviewsFromUsers: json["reviews_from_users"],
        reviewsFromCritics: json["reviews_from_critics"] == null
            ? null
            : json["reviews_from_critics"],
      );

  Map<String, dynamic> toJson() => {
        "imdb_title_id": imdbTitleId,
        "title": title,
        "year": year,
        "genre": List<dynamic>.from(genre.map((x) => x)),
        "country": countryValues.reverse[country],
        "language": List<dynamic>.from(language.map((x) => x)),
        "director": director,
        "writer": List<dynamic>.from(writer.map((x) => x)),
        "production_company": productionCompany,
        "actors": List<dynamic>.from(actors.map((x) => x)),
        "description": description,
        "avg_vote": avgVote,
        "votes": votes,
        "budget": budget == null ? null : budget,
        "metascore": metascore == null ? null : metascore,
        "reviews_from_users": reviewsFromUsers,
        "reviews_from_critics":
            reviewsFromCritics == null ? null : reviewsFromCritics,
      };
}

enum Country { USA, FRANCE_IRAN_USA, POLAND_RUSSIA_USA }

final countryValues = EnumValues({
  "France, Iran, USA": Country.FRANCE_IRAN_USA,
  "Poland, Russia, USA": Country.POLAND_RUSSIA_USA,
  "USA": Country.USA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
