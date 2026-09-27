import 'package:dartz/dartz.dart';
import 'package:movie/domain/usecases/usecase.dart';


import '../enities/app_error.dart';
import '../enities/movie_params.dart';
import '../repostiries/movie_repository.dart';

class CheckIfFavoriteMovie extends UseCase<bool, MovieParams> {
  final MovieRepository movieRepository;

  CheckIfFavoriteMovie(this.movieRepository);

  @override
  Future<Either<AppError, bool>> call(MovieParams movieParams) async {
    return await movieRepository.checkIfMovieFavorite(movieParams.id);
  }
}