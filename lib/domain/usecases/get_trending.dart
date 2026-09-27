import 'package:dartz/dartz.dart';
import 'package:movie/domain/enities/movie_entity.dart';
import 'package:movie/domain/enities/no_params.dart';
import 'package:movie/domain/repostiries/movie_repository.dart';
import 'package:movie/domain/usecases/usecase.dart';

import '../enities/app_error.dart';

class GetTrending extends UseCase<List<MovieEntity>, NoParams> {
  final MovieRepository repository;

  GetTrending(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(NoParams noParams) async {
    return await repository.getTrending();
  }
}
