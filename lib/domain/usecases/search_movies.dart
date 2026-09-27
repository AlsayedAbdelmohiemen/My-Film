import 'package:dartz/dartz.dart';
import 'package:movie/domain/usecases/usecase.dart';


import '../enities/app_error.dart';
import '../enities/movie_entity.dart';
import '../enities/movie_search_params.dart';
import '../repostiries/movie_repository.dart';

class SearchMovies extends UseCase<List<MovieEntity>, MovieSearchParams> {
  final MovieRepository repository;

  SearchMovies(this.repository);

  @override
  Future<Either<AppError, List<MovieEntity>>> call(
      MovieSearchParams searchParams) async {
    return await repository.getSearchedMovies(searchParams.searchTerm);
  }
}