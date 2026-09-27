import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie/domain/enities/app_error.dart';

import '../../../domain/enities/movie_entity.dart';
import '../../../domain/enities/no_params.dart';
import '../../../domain/usecases/get_trending.dart';
import '../movie_backdrop/movie_backdrop_bloc.dart';
part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc({
    required this.getTrending,
    required this.movieBackdropBloc,
  }) : super(MovieCarouselInitial()) {
    // Register a handler for CarouselLoadEvent
    on<CarouselLoadEvent>((event, emit) async {
      final moviesEither = await getTrending(NoParams());
      moviesEither.fold(
        (l) => emit(MovieCarouselError(AppErrorType.network)),
        (movies) {
          movieBackdropBloc
              .add(MovieBackdropChangedEvent(movies[event.defaultIndex]));
          emit(MovieCarouselLoaded(
            movies: movies,
            defaultIndex: event.defaultIndex,
          ));
        },
      );
    });
  }
}
