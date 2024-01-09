import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Implementando el provider
final movieDetailProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
});


/* Mapa (state)(<String, Movie>)
 {
  '509876' : Movie()
  '503473' : Movie()
  '507677' : Movie()
  '501975' : Movie()
 }
 */

//definimos un callback
//todo: pedir a chatgpt que explique esta linea 🤖
typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }) : super({});

  Future<void> loadMovie(String movieId) async {
    //Verificamos si en el mapa(state) ya tiene una pelicula cargada
    if (state[movieId] != null) return;

    print('realizando peticion http');

    final movie = await getMovie(movieId);

    //Clonamos el estado
    state = {...state, movieId: movie};
  }
}
