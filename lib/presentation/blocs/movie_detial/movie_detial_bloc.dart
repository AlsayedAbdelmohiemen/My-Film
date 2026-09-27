import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie/presentation/blocs/favorite/favorite_event.dart';

import '../../../domain/enities/app_error.dart';
import '../../../domain/enities/movie_detail_entity.dart';
import '../../../domain/enities/movie_params.dart';
import '../../../domain/usecases/get_movie_detail.dart';
import '../cast/cast_bloc.dart';
import '../favorite/favorite_bloc.dart';
import '../videos/video_event.dart';
import '../videos/videos_bloc.dart';
import 'movie_detail._event.dart';
import 'movie_detail_state.dart';


class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final CastCrewBloc getCastBloc;
  final VideosBloc videosBloc;
  final FavoriteBloc favoriteBloc;

  MovieDetailBloc( {
    required this.getMovieDetail,
    required this.getCastBloc,
    required this.videosBloc,
    required this.favoriteBloc,
  }) : super(MovieDetailInitial()) {
    on<MovieDetailLoadEvent>((event, emit) async {
      emit(MovieDetailLoading());

      final Either<AppError, MovieDetailEntity> eitherResponse =
      await getMovieDetail(MovieParams(id: event.movieId));

      emit(eitherResponse.fold(
            (l) => MovieDetailError(),
            (r) => MovieDetailLoaded(r),
      ));

      getCastBloc.add(LoadCastEvent(movieId: event.movieId));
      videosBloc.add(LoadVideosEvent(event.movieId));
      favoriteBloc.add(CheckIfFavoriteMovieEvent(event.movieId));

    });
  }


}