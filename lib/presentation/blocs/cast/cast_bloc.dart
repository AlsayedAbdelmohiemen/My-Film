import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:movie/domain/enities/movie_params.dart';
import 'package:movie/domain/usecases/get_cast.dart';

import '../../../domain/enities/app_error.dart';
import '../../../domain/enities/cast_entity.dart';
part 'cast_event.dart';
part 'cast_state.dart';

class CastCrewBloc extends Bloc<CastCrewEvent, CastCrewState> {
  final GetCast getCast;
  CastCrewBloc(this.getCast) : super(CastCrewInitial()) {
    on<CastCrewEvent>((event, emit) async {
      if (event is LoadCastEvent) {
        final eitherResponse = await getCast(MovieParams(id: event.movieId));
        emit(
          eitherResponse.fold(
                (error) => CastError(typeError: error!.appErrorType),
                (casts) => CastLoaded(casts: casts),
          ),
        );
      }
    });
  }
}