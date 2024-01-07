//Clase abstracta para obtener origenes de datos
import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  //Metodo a implementar para obtener las movies recientes
  Future<List<Movie>> getNowPlaying({int page = 1});
}
