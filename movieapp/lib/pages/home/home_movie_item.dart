import 'package:flutter/material.dart';
import 'package:movieapp/models/home_model.dart';
import 'package:movieapp/widgets/dashed_line.dart';
import 'package:movieapp/widgets/star_rating.dart';

class HomeMovieItem extends StatelessWidget {
  final MovieItem movie;

  HomeMovieItem({
    Key key,
    this.movie
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 8, color: Colors.grey[100])
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          SizedBox(height: 10,),
          buildContent(),
          SizedBox(height: 10,),
          buildFooter(),
        ],
      ),
    );
  }
  // 1. Header
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(6),
      ),
        child: Text(
          "No.${movie.rank}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.orange
          ),
        ),
    );
  }
  // 2. Content
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        SizedBox(width: 8,),
        buildContentInfo(),
        SizedBox(width: 8,),
        buildContentLine(),
        SizedBox(width: 8,),
        buildContentWish(),
      ],
    );
  }
  // 2.1 ContentImage
  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        movie.imageURL,
        height: 100,
      ),
    );
  }
  // 2.2 ContentInfo
  Widget buildContentInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          SizedBox(height: 8,),
          buildContentInfoRating(),
          SizedBox(height: 8,),
          buildContentInfoDesc(),
        ],
      ),
    );
  }
  // 2.2.1 ContentInfoTitle
  Widget buildContentInfoTitle() {
    List<InlineSpan> spans = [];
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
            child: Icon(
              Icons.play_circle_outline,
              color: Colors.pink,
              size: 35,
            ),
            baseline: TextBaseline.ideographic,
            alignment: PlaceholderAlignment.middle,
          ),
          ...movie.originalTitle.runes.map((rune) {
            return WidgetSpan(
              child: Text(
                new String.fromCharCode(rune),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
              ),
            );
          }).toList(),
          WidgetSpan(
            child: Text(
              "(${movie.playDate})"
            ),
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            alignment: PlaceholderAlignment.top
          ),
        ]
      ),
    );
  }
  // 2.2.2 ContentInfoRating
  Widget buildContentInfoRating() {
    return Row(
      children: <Widget>[
        StarRating(
          rating: movie.rating,
          size: 20,
        ),
        SizedBox(width: 6,),
        Text("${movie.rating}", style: TextStyle(fontSize: 16),),
      ],
    );
  }
  // 2.2.3 ContentInfoDesc
  Widget buildContentInfoDesc() {
    // final genresString = movie.genres.join(" ");
    final directorsString = movie.director.name;
    final castsString = movie.casts.map((item) => item.name).join(" ");
    return Text(
      "$directorsString / $castsString",
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
  // 2.3 DottedLine
  Widget buildContentLine() {
    return Container(
      height: 120,
      child: DashedLine(
        axis: Axis.vertical,
        dashedWidth: .4,
        dashedHeight: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }
  // 2.4 like
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/images/home/wish.png", height: 25,),
          Text(
            "Like",
            style: TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 235, 170, 60),
            ),
          )
        ],
      ),
    );
  }
  // 3. Footer
  Widget buildFooter() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Color(0xfff2f2f2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        movie.originalTitle,
        style: TextStyle(
          fontSize: 20,
          color: Color(0xff999966)
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}