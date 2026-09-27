import 'package:movie/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/blocs/searh_movie/search_movie_bloc.dart';
import 'package:movie/presentation/blocs/searh_movie/search_movie_state.dart';
import 'package:movie/presentation/journeys/Search_movie/search_movie_card.dart';
import 'package:movie/presentation/themes/app_color.dart';
import 'package:movie/presentation/themes/theme_text.dart';

import '../../../common/constants/size_constants.dart';
import '../../blocs/searh_movie/search_movie_event.dart';
import '../../widgets/app_error_widget.dart';
class CustomSearchDelegate extends SearchDelegate {
  final SearchMovieBloc searchMovieBloc;

  CustomSearchDelegate(this.searchMovieBloc);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        color: AppColor.vulcan,
      ),
      inputDecorationTheme: InputDecorationTheme(

        hintStyle: Theme.of(context).textTheme.greySubtitle1,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.vulcan),
        ),


      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
          color: query.isEmpty ? Colors.grey : AppColor.royalBlue,
        ),
        onPressed: query.isEmpty ? null : () => query = '',
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return GestureDetector(
      onTap: () {
        close(context, null);
      },
      child: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
        size: Sizes.dimen_12,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    searchMovieBloc.add(
      SearchTermChangedEvent(query),
    );

    return BlocBuilder<SearchMovieBloc, SearchMovieState>(
      bloc: searchMovieBloc,
      builder: (context, state) {
        if (state is SearchMovieError) {
          return AppErrorWidget(
            errorType: state.errorType,
            onPressed: () =>
                searchMovieBloc?.add(SearchTermChangedEvent(query)),
          );
        } else
        if (state is SearchMovieLoaded) {
          final movies = state.movies;
          if (movies.isEmpty) {
            return Center(

              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_64),
                child: Text(
                  AppLocalizations.of(context)!.noMoviesSearched,
                  textAlign: TextAlign.center,
                ),

              ),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) => SearchMovieCard(
              movie: movies[index],
            ),
            itemCount: movies.length,
            scrollDirection: Axis.vertical,
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return SizedBox.shrink();
  }
}