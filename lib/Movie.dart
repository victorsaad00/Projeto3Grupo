class Movie {
  String imdbTitleId;
  String title;
  String year;
  List<String> genre;
  String country;
  List<String> language;
  List<String> director;
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

  Movie(
      {this.imdbTitleId,
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
      this.reviewsFromCritics});

  Movie.fromJson(Map<String, dynamic> json) {
    imdbTitleId = json['imdb_title_id'];
    title = json['title'];
    year = json['year'];
    genre = json['genre'].cast<String>();
    country = json['country'];
    language = json['language'].cast<String>();
    director = json['director'].cast<String>();
    writer = json['writer'].cast<String>();
    productionCompany = json['production_company'];
    actors = json['actors'].cast<String>();
    description = json['description'];
    avgVote = json['avg_vote'];
    votes = json['votes'];
    budget = json['budget'];
    metascore = json['metascore'];
    reviewsFromUsers = json['reviews_from_users'];
    reviewsFromCritics = json['reviews_from_critics'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imdb_title_id'] = this.imdbTitleId;
    data['title'] = this.title;
    data['year'] = this.year;
    data['genre'] = this.genre;
    data['country'] = this.country;
    data['language'] = this.language;
    data['director'] = this.director;
    data['writer'] = this.writer;
    data['production_company'] = this.productionCompany;
    data['actors'] = this.actors;
    data['description'] = this.description;
    data['avg_vote'] = this.avgVote;
    data['votes'] = this.votes;
    data['budget'] = this.budget;
    data['metascore'] = this.metascore;
    data['reviews_from_users'] = this.reviewsFromUsers;
    data['reviews_from_critics'] = this.reviewsFromCritics;
    return data;
  }
}
