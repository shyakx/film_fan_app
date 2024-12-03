import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'movie_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Now Playing Movies')),
      body: FutureBuilder(
        future: ApiService().getNowPlayingMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading movies.'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No movies found.'));
          }

          final movies = snapshot.data!;
          movies.sort((a, b) => a['title'].compareTo(b['title'])); // Alphabetical sorting

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                leading: Image.network(
                  'https://image.tmdb.org/t/p/w92${movie['poster_path']}',
                  fit: BoxFit.cover,
                ),
                title: Text(movie['title']),
                subtitle: Text('Release Date: ${movie['release_date']}'),
                trailing: Text('Rating: ${movie['vote_average']}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsScreen(movieId: movie['id']),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
