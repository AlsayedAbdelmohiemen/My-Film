import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/blocs/videos/video_event.dart';
import 'package:movie/presentation/blocs/videos/videos_state.dart';


import '../../../domain/enities/app_error.dart';
import '../../../domain/enities/movie_params.dart';
import '../../../domain/enities/video_entity.dart';
import '../../../domain/usecases/get_video.dart';

class VideosBloc extends Bloc<VideosEvent, VideosState> {
  final GetVideos getVideos;

  VideosBloc({
    required this.getVideos,
  }) : super(VideosInitial()) {
    on<LoadVideosEvent>((event, emit) async {
      final Either<AppError, List<VideoEntity>> eitherVideoResponse =
      await getVideos(MovieParams(id:event.movieId));

      emit(eitherVideoResponse.fold(
            (l) => NoVideos(),
            (r) => VideosLoaded(r),
      ));
    });
  }

// Rest of your VideosBloc implementation...
}
