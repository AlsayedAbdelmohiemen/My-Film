import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/enities/app_error.dart';
import '../../../domain/enities/movie_entity.dart';
import '../../../domain/enities/no_params.dart';
import '../../../domain/usecases/get_coming_soon.dart';
import '../../../domain/usecases/get_playing_now.dart';
import '../../../domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;

  MovieTabbedBloc({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(MovieTabbedInitial(currentTabIndex: 0)) {
    on<MovieTabChangedEvent>((event, emit) async {
      Either<AppError, List<MovieEntity>> moviesEither;
      switch (event.currentTabIndex) {
        case 0:
          moviesEither = await getPopular(NoParams());
          break;
        case 1:
          moviesEither = await getPlayingNow(NoParams());
          break;
        case 2:
          moviesEither = await getComingSoon(NoParams());
          break;
        default:
          moviesEither = Left(AppError(AppErrorType.network));
          break;
      }

      emit(moviesEither.fold(
        (l) => MovieTabLoadError(currentTabIndex: event.currentTabIndex),
        (movies) => MovieTabChanged(
          currentTabIndex: event.currentTabIndex,
          movies: movies,
        ),
      ));
    });
  }

// Rest of your MovieTabbedBloc implementation...
}
