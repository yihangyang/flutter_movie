import 'package:flutter/material.dart';
import 'package:movieapp/models/home_model.dart';
import 'package:movieapp/pages/home/home_movie_item.dart';
import 'package:movieapp/services/home_request.dart';

class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  final List<MovieItem> movies = [];
  @override
  void initState() {
    super.initState();

    // send internet request
    HomeRequest.requestMovieList(0).then((res) {
      setState(() {
        movies.addAll(res);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (ctx, index) {
        return HomeMovieItem(
          movie: movies[index],
        );
      }
    );
  }
}