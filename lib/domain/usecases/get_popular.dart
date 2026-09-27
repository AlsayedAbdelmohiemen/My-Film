import 'package:dartz/dartz.dart';
import 'package:movie/domain/usecases/usecase.dart';

import '../enities/app_error.dart';
import '../enities/movie_entity.dart';
import '../enities/no_params.dart';
import '../repostiries/movie_repository.dart';

class GetPopular extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetPopular(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getPopular();
  }
}
