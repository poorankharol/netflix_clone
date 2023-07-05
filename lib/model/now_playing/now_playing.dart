class NowPlaying {
  Dates? dates;
  int? page;
  List<Results?>? results;
  int? totalPages;
  int? totalResults;

  NowPlaying(
      {required dates,
      required page,
      required results,
      required totalPages,
      required totalResults});

  NowPlaying.fromJson(Map<String, dynamic> json) {
    dates = (json['dates'] != null ? Dates.fromJson(json['dates']) : null)!;
    page = json['page'];
    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dates'] = dates!.toJson();
    data['page'] = page;
    data['results'] = results!.map((v) => v!.toJson()).toList();
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}

class Dates {
  String? maximum;
  String? minimum;

  Dates({required maximum, required minimum});

  Dates.fromJson(Map<String, dynamic> json) {
    maximum = json['maximum'];
    minimum = json['minimum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['maximum'] = maximum;
    data['minimum'] = minimum;
    return data;
  }
}

class Results {
  late bool adult;
  late String backdropPath;
  late List<int> genreIds;
  late int id;
  late String originalLanguage;
  late String originalTitle;
  late String overview;
  late double popularity;
  late String posterPath;
  late String releaseDate;
  late String title;
  late bool video;
  late double voteAverage;
  late int voteCount;

  Results(
      {required adult,
      required backdropPath,
      required genreIds,
      required id,
      required originalLanguage,
      required originalTitle,
      required overview,
      required popularity,
      required posterPath,
      required releaseDate,
      required title,
      required video,
      required voteAverage,
      required voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    //adult = json['adult'];
    //backdropPath = json['backdrop_path'];
    //genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    //originalLanguage = json['original_language'];
    //originalTitle = json['original_title'];
    //overview = json['overview'];
    //popularity = json['popularity'];
    posterPath = json['poster_path'];
    //releaseDate = json['release_date'];
    //title = json['title'];
    //video = json['video'];
    //voteAverage = json['vote_average'];
    //voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adult'] = adult;
    data['backdrop_path'] = backdropPath;
    data['genre_ids'] = genreIds;
    data['id'] = id;
    data['original_language'] = originalLanguage;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['popularity'] = popularity;
    data['poster_path'] = posterPath;
    data['release_date'] = releaseDate;
    data['title'] = title;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    return data;
  }
}
