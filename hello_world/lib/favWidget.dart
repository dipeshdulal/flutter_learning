
import 'package:flutter/material.dart';

class _FavouriteWidgetState extends State<FavouriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;

  @override
  Widget build(BuildContext context) => _makeStar(_isFavorited, _favoriteCount);

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount = 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  Row _makeStar(bool selected, int number) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: selected ? Icon(Icons.star) : Icon(Icons.star_border),
          color: Colors.red[500],
          onPressed: _toggleFavorite,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            number.toString(),
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class FavouriteWidget extends StatefulWidget {
  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}