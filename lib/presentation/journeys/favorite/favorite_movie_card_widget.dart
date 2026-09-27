import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movie/presentation/journeys/movie_detail/movie_detail_arguments.dart';


import '../../../common/constants/route_constants.dart';
import '../../../common/constants/size_constants.dart';
import '../../../data/core/api_constants.dart';
import '../../../domain/enities/movie_entity.dart';
import '../../blocs/favorite/favorite_event.dart';

class FavoriteMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCardWidget({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: Sizes.dimen_8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_8),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(RouteList.movieDetail, arguments: MovieDetailArguments(movie.id));
        
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_8),
          child: Stack(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
                fit: BoxFit.cover,
                width: Sizes.dimen_150,
              ),
              Positioned(
                top: Sizes.dimen_12,
                right: Sizes.dimen_8,
                child: GestureDetector(
                  onTap: () => BlocProvider.of<FavoriteBloc>(context)
                      .add(DeleteFavoriteMovieEvent(movie.id)),
                  child: Icon(
                    Icons.delete,
                    size: Sizes.dimen_24,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
