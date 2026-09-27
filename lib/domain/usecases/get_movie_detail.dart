import 'package:dartz/dartz.dart';
import 'package:movie/domain/enities/app_error.dart';
import 'package:movie/domain/enities/movie_detail_entity.dart';
import 'package:movie/domain/enities/movie_params.dart';
import 'package:movie/domain/repostiries/movie_repository.dart';
import 'package:movie/domain/usecases/usecase.dart';

class GetMovieDetail extends UseCase<MovieDetailEntity, MovieParams> {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  @override
  Future<Either<AppError, MovieDetailEntity>> call(
      MovieParams movieParams) async {
    return await repository.getMovieDetail(movieParams.id);
  }
}