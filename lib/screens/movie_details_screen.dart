import 'package:flutter/material.dart';
import '../services/api_service.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details')),
      body: FutureBuilder(
        future: ApiService().getMovieDetails(movieId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading details.'));
          }

          final movie = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('https://image.tmdb.org/t/p/w500${movie['poster_path']}'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie['title'], style: Theme.of(context).textTheme.headlineSmall),
                      const SizedBox(height: 8),
                      Text('Release Date: ${movie['release_date']}'),
                      const SizedBox(height: 16),
                      Text(movie['overview']),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}