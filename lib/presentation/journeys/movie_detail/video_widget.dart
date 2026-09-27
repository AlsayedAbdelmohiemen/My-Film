import 'package:movie/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/common/constants/route_constants.dart';
import 'package:movie/presentation/blocs/videos/videos_bloc.dart';
import 'package:movie/presentation/blocs/videos/videos_state.dart';
import 'package:movie/presentation/widgets/button.dart';


import 'watch_video/watch_video_arguments.dart';
import 'watch_video/watch_video_screen.dart';

class VideosWidget extends StatelessWidget {
  final VideosBloc videosBloc;

  const VideosWidget({

    required this.videosBloc,
  }) ;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: videosBloc,
      builder: (context, state) {
        if (state is VideosLoaded && state.videos.iterator.moveNext()) {
          final _videos = state.videos;
          return Button(
            text: AppLocalizations.of(context)!.watchTrailers,
            onPressed: () {
             Navigator.of(context).pushNamed(RouteList.watchTrailer,arguments: WatchVideoArguments(_videos));
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}