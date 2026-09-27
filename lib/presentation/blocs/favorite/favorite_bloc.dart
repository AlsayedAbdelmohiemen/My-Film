import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/enities/app_error.dart';
import '../../../domain/enities/movie_entity.dart';
import '../../../domain/enities/movie_params.dart';
import '../../../domain/enities/no_params.dart';
import '../../../domain/usecases/check_if_movie_favorite.dart';
import '../../../domain/usecases/delete_favorite_movie.dart';
import '../../../domain/usecases/get_favorite_movie.dart';
import '../../../domain/usecases/save_movie.dart';
import 'favorite_event.dart';
import 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final SaveMovie saveMovie;
  final GetFavoriteMovies getFavoriteMovies;
  final DeleteFavoriteMovie deleteFavoriteMovie;
  final CheckIfFavoriteMovie checkIfFavoriteMovie;

  FavoriteBloc({
    required this.saveMovie,
    required this.getFavoriteMovies,
    required this.deleteFavoriteMovie,
    required this.checkIfFavoriteMovie,
  }) : super(FavoriteInitial()) {
    on<ToggleFavoriteMovieEvent>((event, emit) async {
      if (event.isFavorite) {
        await deleteFavoriteMovie(MovieParams(id:event.movieEntity.id));
      } else {
        await saveMovie(event.movieEntity);
      }
      final response =
      await checkIfFavoriteMovie(MovieParams(id:event.movieEntity.id));
      emit(response.fold(
            (l) => FavoriteMoviesError(),
            (r) => IsFavoriteMovie(r),
      ));
    });

    on<LoadFavoriteMovieEvent>((event, emit) async {
      final Either<AppError, List<MovieEntity>> response =
      await getFavoriteMovies(NoParams());

      emit(response.fold(
            (l) => FavoriteMoviesError(),
            (r) => FavoriteMoviesLoaded(r),
      ));
    });

    on<DeleteFavoriteMovieEvent>((event, emit) async {
      await deleteFavoriteMovie(MovieParams(id:event.movieId));
      final Either<AppError, List<MovieEntity>> response =
      await getFavoriteMovies(NoParams());

      emit(response.fold(
            (l) => FavoriteMoviesError(),
            (r) => FavoriteMoviesLoaded(r),
      ));
    });

    on<CheckIfFavoriteMovieEvent>((event, emit) async {
      final response = await checkIfFavoriteMovie(MovieParams(id:event.movieId));
      emit(response.fold(
            (l) => FavoriteMoviesError(),
            (r) => IsFavoriteMovie(r),
      ));
    });
  }
}
