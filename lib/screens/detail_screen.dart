import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_detail_model.dart';
import 'package:movieflix/services/api_services.dart';

class DetailScreen extends StatefulWidget {
  final String id, title, backdropPath;
  const DetailScreen({
    super.key,
    required this.id,
    required this.title,
    required this.backdropPath,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Future<MovieDetailModel> movie;

  @override
  void initState() {
    super.initState();
    movie = ApiService.getDetailMovies(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(widget.backdropPath).image,
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.7),
        appBar: AppBar(
          title: const Text(
            'Back to list',
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Theme.of(context).highlightColor,
        ),
        body: Column(
          children: [
            FutureBuilder(
              future: movie,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 200,
                            ),
                            Text(
                              snapshot.data!.originalTitle,
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .color),
                            ),
                            Row(
                              children: [
                                for (var i = 0;
                                    i < snapshot.data!.voteAverage;
                                    i++)
                                  const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                for (var i = 0;
                                    i < 5 - snapshot.data!.voteAverage;
                                    i++)
                                  const Icon(
                                    Icons.star,
                                    color: Colors.grey,
                                  ),
                              ],
                            ),
                            Text(
                              textAlign: TextAlign.center,
                              snapshot.data!.overview,
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w800,
                                color: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .color,
                                fontFamily: 'JSlab',
                                textBaseline: TextBaseline.ideographic,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  );
                }
                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
