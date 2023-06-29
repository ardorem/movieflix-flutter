import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';

class MovieLandScapeSize extends StatelessWidget {
  const MovieLandScapeSize({
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
          width: 350,
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
          child: Image.network(movie.backdropPath),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          movie.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
