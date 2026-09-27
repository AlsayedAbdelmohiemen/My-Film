import 'package:movie/domain/usecases/usecase.dart';

import '../enities/app_error.dart';
import 'package:dartz/dartz.dart';

import '../enities/movie_entity.dart';
import '../repostiries/movie_repository.dart';

class SaveMovie extends UseCase<void, MovieEntity> {
  final MovieRepository movieRepository;

  SaveMovie(this.movieRepository);

  @override
  Future<Either<AppError, void>> call(MovieEntity params) async {
    return await movieRepository.saveMovie(params);
  }
}