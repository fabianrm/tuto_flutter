import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Implementando el provider
final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final actorsRepository = ref.watch(actorsRepositoryProvider);
  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

/* Mapa (state)(<String, Movie>)
 {
  '509876' :  List<Actor>
  '503473' :  List<Actor>
  '507677' :  List<Actor>
  '501975' :  List<Actor>
 }
 */

//definimos un callback
//todo: pedir a chatgpt que explique esta linea 🤖
typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors,
  }) : super({});

  Future<void> loadActors(String movieId) async {
    //Verificamos si en el mapa(state) ya tiene una pelicula cargada
    if (state[movieId] != null) return;

    // print('realizando peticion http');

    final List<Actor> actors = await getActors(movieId);

    //Clonamos el estado
    state = {...state, movieId: actors};
  }
}
