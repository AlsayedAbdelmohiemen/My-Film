import 'package:flutter/material.dart';

import '../../../../domain/enities/movie_entity.dart';

import '../../../widgets/movie_app_bar.dart';
import '../../../widgets/separator.dart';

import 'movie_backdrop_widget.dart';
import 'movie_data_widget.dart';
import 'movie_page_view.dart';

class MovieCarouselWidget extends StatelessWidget {
  final List<MovieEntity> movies;
  final int defaultIndex;

  const MovieCarouselWidget({
    required this.movies,
    required this.defaultIndex,
  }) : assert(defaultIndex >= 0, 'defaultIndex cannot be less than 0');

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        SingleChildScrollView(
          child: Column(
            children: [
              MovieAppBar(),
              MoviePageView(
                movies: movies,
                initialPage: defaultIndex,
                key: UniqueKey(),
              ),
              MovieDataWidget(),
              Separator(),
            ],
          ),
        ),
      ],
    );
  }
}
