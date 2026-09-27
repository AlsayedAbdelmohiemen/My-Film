import 'package:movie/domain/usecases/usecase.dart';

import '../enities/app_error.dart';
import 'package:dartz/dartz.dart';

import '../enities/movie_entity.dart';
import '../enities/no_params.dart';
import '../repostiries/movie_repository.dart';

class GetFavoriteMovies extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository movieRepository;

  GetFavoriteMovies(this.movieRepository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await movieRepository.getFavoriteMovies();
  }
}