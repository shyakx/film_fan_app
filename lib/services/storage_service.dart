import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  Future<void> addToFavourites(String movieId) async {
    final prefs = await SharedPreferences.getInstance();
    final favourites = prefs.getStringList('favourites') ?? [];
    if (!favourites.contains(movieId)) {
      favourites.add(movieId);
      await prefs.setStringList('favourites', favourites);
    }
  }

  Future<List<String>> getFavourites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favourites') ?? [];
  }
}
