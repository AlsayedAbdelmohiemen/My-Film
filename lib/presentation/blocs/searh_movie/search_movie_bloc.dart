
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/blocs/searh_movie/search_movie_event.dart';
import 'package:movie/presentation/blocs/searh_movie/search_movie_state.dart';


import '../../../domain/enities/app_error.dart';
import '../../../domain/enities/movie_entity.dart';
import '../../../domain/enities/movie_search_params.dart';
import '../../../domain/usecases/search_movies.dart';

class SearchMovieBloc extends Bloc<SearchMovieEvent, SearchMovieState> {
  final SearchMovies searchMovies;

  SearchMovieBloc({
    required this.searchMovies,
  }) : super(SearchMovieInitial()) {
    on<SearchTermChangedEvent>((event, emit) async {
      if (event.searchTerm.length > 2) {
        emit(SearchMovieLoading());
        final Either<AppError, List<MovieEntity>> response =
        await searchMovies(MovieSearchParams(searchTerm: event.searchTerm));
        emit(response.fold(
              (l) => SearchMovieError(l.appErrorType),
              (r) => SearchMovieLoaded(r),
        ));
      }
    });
  }
}