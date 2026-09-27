import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie/data/core/api_client.dart';
import 'package:movie/data/data_sources/movie_remote_data_source.dart';
import 'package:movie/domain/usecases/get_coming_soon.dart';
import 'package:movie/domain/usecases/get_movie_detail.dart';
import 'package:movie/domain/usecases/get_playing_now.dart';
import 'package:movie/domain/usecases/get_popular.dart';
import 'package:movie/domain/usecases/get_trending.dart';
import 'package:movie/domain/usecases/get_video.dart';
import 'package:movie/presentation/blocs/movie_detial/movie_detial_bloc.dart';
import '../data/data_sources/movie_local_data_source.dart';
import '../domain/repostiries/movie_repository.dart';
import '../data/repostitiries/movie_repository_impl.dart';
import '../domain/usecases/check_if_movie_favorite.dart';
import '../domain/usecases/delete_favorite_movie.dart';
import '../domain/usecases/get_cast.dart';
import '../domain/usecases/get_favorite_movie.dart';
import '../domain/usecases/save_movie.dart';
import '../domain/usecases/search_movies.dart';
import '../presentation/blocs/cast/cast_bloc.dart';
import '../presentation/blocs/favorite/favorite_bloc.dart';
import '../presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import '../presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import '../presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import '../presentation/blocs/searh_movie/search_movie_bloc.dart';
import '../presentation/blocs/videos/videos_bloc.dart';

final getItInstance = GetIt.I;

Future<void> init() async {
  getItInstance.registerLazySingleton<Client>(() => Client());

  getItInstance
      .registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getItInstance()));

  getItInstance.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl());

  getItInstance.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getItInstance(), getItInstance()));

  getItInstance.registerLazySingleton<GetMovieDetail>(
      () => GetMovieDetail(getItInstance()));
  getItInstance
      .registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));

  getItInstance
      .registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));

  getItInstance.registerLazySingleton<GetComingSoon>(
      () => GetComingSoon(getItInstance()));

  getItInstance.registerLazySingleton<GetPlayingNow>(
      () => GetPlayingNow(getItInstance()));

  getItInstance.registerFactory(() => MovieBackdropBloc());

  getItInstance.registerLazySingleton<GetCast>(
          () => GetCast(repository: getItInstance()));
  getItInstance
      .registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));
  getItInstance
      .registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));

  getItInstance
      .registerLazySingleton<SaveMovie>(() => SaveMovie(getItInstance()));

  getItInstance.registerLazySingleton<GetFavoriteMovies>(
      () => GetFavoriteMovies(getItInstance()));

  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
      () => DeleteFavoriteMovie(getItInstance()));

  getItInstance.registerLazySingleton<CheckIfFavoriteMovie>(
      () => CheckIfFavoriteMovie(getItInstance()));

  getItInstance.registerFactory(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => MovieTabbedBloc(
      getPopular: GetPopular(getItInstance()),
      getComingSoon: GetComingSoon(getItInstance()),
      getPlayingNow: GetPlayingNow(getItInstance()),
    ),
  );
  getItInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      getCastBloc: getItInstance(),
      videosBloc: getItInstance(),
      favoriteBloc: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
        () => CastCrewBloc(
      getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => VideosBloc(
      getVideos: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => SearchMovieBloc(
      searchMovies: getItInstance(),
    ),
  );
  getItInstance.registerFactory(
    () => FavoriteBloc(
      saveMovie: getItInstance(),
      checkIfFavoriteMovie: getItInstance(),
      deleteFavoriteMovie: getItInstance(),
      getFavoriteMovies: getItInstance(),
    ),
  );
}
