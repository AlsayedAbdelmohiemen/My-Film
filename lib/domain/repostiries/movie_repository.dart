
import 'package:dartz/dartz.dart';
import 'package:movie/domain/enities/cast_entity.dart';
import 'package:movie/domain/enities/movie_detail_entity.dart';
import 'package:movie/domain/enities/movie_entity.dart';
import 'package:movie/domain/enities/video_entity.dart';


import '../enities/app_error.dart';

abstract class MovieRepository {
  Future<Either<AppError, List<MovieEntity>>> getTrending();

  Future<Either<AppError, List<MovieEntity>>> getPopular();

  Future<Either<AppError, List<MovieEntity>>> getPlayingNow();

  Future<Either<AppError, List<MovieEntity>>> getComingSoon();

  Future<Either<AppError, MovieDetailEntity>> getMovieDetail(int id);

  Future<Either<AppError, List<CastEntity>>> getCastCrew(int id);

  Future<Either<AppError, List<VideoEntity>>> getVideos(int id);

  Future<Either<AppError, List<MovieEntity>>> getSearchedMovies(
      String searchTerm);
  Future<Either<AppError, void>> saveMovie(MovieEntity movieEntity);
  Future<Either<AppError, List<MovieEntity>>> getFavoriteMovies();
  Future<Either<AppError, void>> deleteFavoriteMovie(int movieId);
  Future<Either<AppError, bool>> checkIfMovieFavorite(int movieId);

}
