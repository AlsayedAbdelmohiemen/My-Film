import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie/l10n/app_localizations.dart';
import 'package:movie/common/constants/size_constants.dart';
import 'package:movie/di/get_it.dart';
import 'package:movie/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie/presentation/blocs/movie_detial/movie_detail._event.dart';
import 'package:movie/presentation/blocs/movie_detial/movie_detail_state.dart';
import 'package:movie/presentation/journeys/movie_detail/big_poster.dart';
import 'package:movie/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:movie/presentation/journeys/movie_detail/video_widget.dart';

import '../../blocs/favorite/favorite_bloc.dart';
import '../../blocs/movie_detial/movie_detial_bloc.dart';
import '../../blocs/videos/videos_bloc.dart';
import 'cast_widget.dart';


class MovieDetailScreen extends StatefulWidget {
  final MovieDetailArguments movieDetailArguments;

  const MovieDetailScreen({
    required this.movieDetailArguments,
  }) : assert(movieDetailArguments != null, 'arguments must not be null');

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  late MovieDetailBloc _movieDetailBloc;
  late CastCrewBloc _castCrewBloc;
  late  VideosBloc _videosBloc;
  late  FavoriteBloc _favoriteBloc;

  @override
  void initState() {
    super.initState();
    _movieDetailBloc = getItInstance<MovieDetailBloc>();
    _castCrewBloc = _movieDetailBloc.getCastBloc;
    _videosBloc = _movieDetailBloc.videosBloc;
    _favoriteBloc = _movieDetailBloc.favoriteBloc;
    _movieDetailBloc.add(
      MovieDetailLoadEvent(
        widget.movieDetailArguments.movieId,
      ),
    );
  }

  @override
  void dispose() {
    _movieDetailBloc?.close();
    _castCrewBloc.close();
    _videosBloc?.close();
    _favoriteBloc?.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: _movieDetailBloc),
          BlocProvider.value(value: _videosBloc),
          BlocProvider.value(value:_castCrewBloc),
          BlocProvider.value(value: _favoriteBloc),
        ],
        child: BlocBuilder<MovieDetailBloc, MovieDetailState>(
          builder: (context, state) {
            if (state is MovieDetailLoaded ) {
              final movieDetail = state.movieDetailEntity;

              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    BigPoster(
                      movie: movieDetail,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_16,
                        vertical: Sizes.dimen_8,
                      ),
                      child: Text(
                        movieDetail.overview,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),

                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: Sizes.dimen_16),
                      child: Text(
                        AppLocalizations.of(context)!.cast,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),

                    CastWidget(),
                    VideosWidget(videosBloc: _videosBloc),

                  ],
                ),
              );
            } else if (state is MovieDetailError) {
              return Container();
            }
            return SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
