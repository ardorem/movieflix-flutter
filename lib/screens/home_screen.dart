import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_services.dart';
import 'package:movieflix/widgets/movie_land_scape_size_widget.dart';
import 'package:movieflix/widgets/movie_portrait_size_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final Future<List<MovieModel>> popularMovies = ApiService.getPopularMovies();
  final Future<List<MovieModel>> nowPlayingMovies =
      ApiService.getNowPlayingMovies();
  final Future<List<MovieModel>> comingSoonMovies =
      ApiService.getComingSoonMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text(
            'Movie Flix',
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //----------------------------------------------------Popular Movies
              FutureBuilder(
                future: popularMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Popular Movies',
                              style: TextStyle(
                                fontSize: 30,
                                color: Theme.of(context).focusColor,
                                shadows: [
                                  Shadow(
                                    color: Theme.of(context).focusColor,
                                    blurRadius: 20,
                                    offset: const Offset(0, 1),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 300,
                          child: makeList(snapshot, isLandScapeSize: true),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              //----------------------------------------------------Now in Cinema
              FutureBuilder(
                future: nowPlayingMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Now in Cinema',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.white,
                                    blurRadius: 20,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 340,
                          child: makeList(snapshot, isLandScapeSize: false),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              //----------------------------------------------------Coming Soon
              FutureBuilder(
                future: comingSoonMovies,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Coming Soon',
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.white,
                                    blurRadius: 20,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 340,
                          child: makeList(snapshot, isLandScapeSize: false),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ));
  }

//---------------------------------------------------------------------- makeList()
  ListView makeList(AsyncSnapshot<List<MovieModel>> snapshot,
      {required bool isLandScapeSize}) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: isLandScapeSize
          ? (context, index) {
              var movie = snapshot.data![index];
              return MovieLandScapeSize(
                title: movie.title,
                backdropPath: movie.backdropPath,
                id: movie.id,
              );
            }
          : (context, index) {
              var movie = snapshot.data![index];
              return MoviePortraitSize(movie: movie);
            },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
