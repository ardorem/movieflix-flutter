import 'package:flutter/material.dart';
import 'package:movieflix/models/movie_model.dart';
import 'package:movieflix/services/api_services.dart';

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
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var movie = snapshot.data![index];
                              return Column(
                                children: [
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    width: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFFD4D4D4)
                                              .withOpacity(0.5),
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
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 40,
                            ),
                          ),
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
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var movie = snapshot.data![index];
                              return Column(
                                children: [
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFFD4D4D4)
                                              .withOpacity(0.5),
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
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                          ),
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
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              var movie = snapshot.data![index];
                              return Column(
                                children: [
                                  Container(
                                    clipBehavior: Clip.hardEdge,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: const Color(0xFFD4D4D4)
                                              .withOpacity(0.5),
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
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              width: 10,
                            ),
                          ),
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
}
