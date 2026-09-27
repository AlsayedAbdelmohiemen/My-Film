import 'package:equatable/equatable.dart';

import '../../../domain/enities/movie_entity.dart';
import "package:bloc/bloc.dart" show Bloc;

part 'movie_backdrop_event.dart';
part 'movie_backdrop_state.dart';
class MovieBackdropBloc extends Bloc<MovieBackdropEvent, MovieBackdropState> {
  MovieBackdropBloc() : super(MovieBackdropInitial()) {
    // Register a handler for MovieBackdropChangedEvent
    on<MovieBackdropChangedEvent>((event, emit) {
      // Handle MovieBackdropChangedEvent here
      // You can update the state using 'emit'
      emit(MovieBackdropChanged(event.movie));
    });
  }

  @override
  Stream<MovieBackdropState> mapEventToState(MovieBackdropEvent event) async* {
    // Handle other events here if needed.
  }
}
