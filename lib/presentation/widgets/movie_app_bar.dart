import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../common/constants/size_constants.dart';
import '../../common/screenutil/screen_util.dart';
import '../blocs/searh_movie/search_movie_bloc.dart';
import '../journeys/Search_movie/custom_search_movie_delegate.dart';
import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.only(
        top: ScreenUtil.statusBarHeight + Sizes.dimen_4,
        left: Sizes.dimen_16,
        right: Sizes.dimen_16,
      ),
      child: Row(
        children: <Widget>[
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: SvgPicture.asset(
              'assets/images/svgs/menu.svg',
              height: Sizes.dimen_12*3,
            ),
          ),
          const Expanded(
            child:  Logo(
              height: Sizes.dimen_14,)
            ),

          IconButton(
            onPressed: () {
              showSearch(context: context, delegate:  CustomSearchDelegate(
                BlocProvider.of<SearchMovieBloc>(context),
              ),
              );
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
              size: Sizes.dimen_12*3,
            ),
          ),
        ],
      ),
    );
  }
}