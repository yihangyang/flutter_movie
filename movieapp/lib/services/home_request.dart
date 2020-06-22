import 'package:movieapp/models/home_model.dart';
import 'package:movieapp/services/config.dart';
import 'package:movieapp/services/http_request.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMovieList(int start) async {
    // 1.build url
    // final oriMovieURL = "/movie/top250?start=?start&count=${HomeConfig.movieCount}";
    // final movieURL = "https://sg.media-imdb.com/suggests/a/a.json";
    // final movieURL = "http://www.omdbapi.com/?t=a&y=1919&apikey=abb38ec3";
    final movieURL = "/movie/in_theaters?apikey=0df993c66c0c636e29ecbb5344252a4a&start=$start&count=${HomeConfig.movieCount}";
    // 2. send net request to get result
    final result = await HttpRequest.request(movieURL);
    final subjects = result["subjects"];

    // 3. turn Map into Model
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }
}