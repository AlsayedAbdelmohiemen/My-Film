import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/constants/size_constants.dart';
import '../../../blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'movie_list_view.dart';
import 'movie_tabbed_constants.dart';
import 'tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key});

  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget> {
  late MovieTabbedBloc movieTabbedBloc;

  @override
  void initState() {
    super.initState();
    movieTabbedBloc = BlocProvider.of<MovieTabbedBloc>(context);
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: 0));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        int currentTabIndex = state.currentTabIndex;
        return Padding(
          padding: const EdgeInsets.only(top: Sizes.dimen_4),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.createMovieTabs(context).length;
                      i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.createMovieTabs(context)[i]
                          .title,
                      onTap: () => _onTabTapped(i),
                      isSelected: i == currentTabIndex,
                    )
                ],
              ),
              if (state is MovieTabChanged)
                Expanded(
                  child: MovieListViewBuilder(movies: state.movies),
                ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
