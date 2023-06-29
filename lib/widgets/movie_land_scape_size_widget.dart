import 'package:flutter/material.dart';
import 'package:movieflix/screens/detail_screen.dart';

class MovieLandScapeSize extends StatelessWidget {
  final String id, title, backdropPath;

  const MovieLandScapeSize({
    super.key,
    required this.id,
    required this.title,
    required this.backdropPath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              id: id,
              title: title,
              backdropPath: backdropPath,
            ),
          ),
        );
      },
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
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
            child: Image.network(backdropPath),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ],
      ),
    );
  }
}
