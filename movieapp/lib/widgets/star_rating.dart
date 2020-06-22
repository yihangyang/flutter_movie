import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselected;
  final Color selected;
  final Widget unselectedImage;
  final Widget selectedImage;

  StarRating({
    @required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselected = Colors.grey,
    this.selected = const Color(0xffff0000),
    Widget unselectedImage,
    Widget selectedImage
    }) : unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselected, size: size),
         selectedImage = selectedImage ?? Icon(Icons.star, color: selected, size: size);
  
  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildUnselectedStars()
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: buildSelectedStars()
        ),
      ],
    );
  }

  List<Widget> buildUnselectedStars() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }
  List<Widget> buildSelectedStars() {
    // 1. build stars
    List<Widget> stars = [];
    final star = widget.selectedImage;

    // 2. build filled stars
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    for (var i = 0; i < entireCount; i++) {
      stars.add(star);
    }

    // 3. build partie star
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final partialStar = ClipRect(
      clipper: MyStarClipper(leftWidth),
      child: star,
    );
    stars.add(partialStar);

    // more stars than the count
    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }
    return stars;
  }
}

class MyStarClipper extends CustomClipper<Rect> {
  double width;

  MyStarClipper(this.width);
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height); 
  }

  @override
  bool shouldReclip(MyStarClipper oldClipper) {
    return oldClipper.width != this.width;
  }
}