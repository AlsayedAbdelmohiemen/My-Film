import 'package:movie/domain/repostiries/movie_repository.dart';
import 'package:movie/domain/usecases/usecase.dart';

import '../enities/app_error.dart';
import 'package:dartz/dartz.dart';

import '../enities/movie_params.dart';

class DeleteFavoriteMovie extends UseCase<void, MovieParams> {
  final MovieRepository movieRepository;

  DeleteFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieParams movieParams) async {
    return await movieRepository.deleteFavoriteMovie(movieParams.id);
  }
}