//Clase abstracta para obtener origenes de datos
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  //Metodo a implementar para obtener las movies recientes
  Future<List<Movie>> getNowPlaying({int page = 1});

  //Metodo para retornar las peliculas populares
  Future<List<Movie>> getPopular({int page = 1});

  //Metodo para retornar las peliculas próximas
  Future<List<Movie>> getUpComing({int page = 1});

  //Metodo para retornar las peliculas más valoradas
  Future<List<Movie>> getTopRated({int page = 1});

  //Metodo obterner movie por id
  Future<Movie> getMovieById(String id);

  //Metodo para realizar busqueda
  Future<List<Movie>> seacrhMovies(String query);
}
