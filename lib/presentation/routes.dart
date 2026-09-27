
import 'package:flutter/cupertino.dart';
import 'package:movie/common/constants/route_constants.dart';

import 'journeys/favorite/favorite_screen.dart';
import 'journeys/home/home_screen.dart';
import 'journeys/movie_detail/movie_detail_arguments.dart';
import 'journeys/movie_detail/movie_detail_screen.dart';
import 'journeys/movie_detail/watch_video/watch_video_arguments.dart';
import 'journeys/movie_detail/watch_video/watch_video_screen.dart';

class Routes {
  static Map<String,WidgetBuilder>getRoutes(RouteSettings settings)=> {
    RouteList.initial: (context) => HomeScreen(),
    RouteList.movieDetail: (context) => MovieDetailScreen(movieDetailArguments:settings.arguments as MovieDetailArguments,),
    RouteList.watchTrailer: (context) => WatchVideoScreen(watchVideoArguments: settings.arguments as WatchVideoArguments,),
    RouteList.favorite: (context) => FavoriteScreen(),


  };
}