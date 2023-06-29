import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';

class MoviePortraitSize extends StatelessWidget {
  const MoviePortraitSize({
    super.key,
    required this.movie,
  });

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          width: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD4D4D4).withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 1),
              )
            ],
          ),
          child: Image.network(movie.posterPath),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 170,
          child: Text(
            movie.title,
            textAlign: TextAlign.center,
            maxLines: 4,
            overflow: TextOverflow.fade,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
