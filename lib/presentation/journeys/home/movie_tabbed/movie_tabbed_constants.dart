

import 'package:flutter/cupertino.dart';

import 'movie_tabbed.dart';
import 'package:movie/l10n/app_localizations.dart';
// class MovieTabbedConstants  {
  //static  List<Tab> movieTabs =  [
    // Tab(index: 0, title: AppLocalizations.of(context)!.favoriteMovies,),
    //Tab(index: 1, title: 'Now'),
    //Tab(index: 2, title: 'Soon'),
  //];


//  }
class MovieTabbedConstants {
  static List<Tab> createMovieTabs(BuildContext context) {
    return [
      Tab(index: 0, title: AppLocalizations.of(context)!.popular),
      Tab(index: 1, title: AppLocalizations.of(context)!.now),
      Tab(index: 2, title: AppLocalizations.of(context)!.soon),
    ];
  }
}
