import 'package:dartz/dartz.dart';
import 'package:movie/domain/enities/cast_entity.dart';
import 'package:movie/domain/enities/movie_params.dart';
import 'package:movie/domain/usecases/usecase.dart';

import '../enities/app_error.dart';
import '../repostiries/movie_repository.dart';


class GetCast extends UseCase<List<CastEntity>, MovieParams> {
  final MovieRepository repository;

  GetCast({required this.repository});

  @override
  Future<Either<AppError, List<CastEntity>>> call(MovieParams params) async {
    return await repository.getCastCrew(params.id);
  }
}