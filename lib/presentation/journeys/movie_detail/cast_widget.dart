
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/presentation/blocs/cast/cast_bloc.dart';
import 'package:movie/presentation/journeys/movie_detail/cast_item.dart';



import '../../../common/constants/size_constants.dart';
import '../../../data/core/api_constants.dart';
class CastWidget extends StatelessWidget {
  const CastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastCrewBloc, CastCrewState>(
      builder: (context, state) {
        if (state is CastLoaded) {
          return SizedBox(
            height: Sizes.dimen_200,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.casts.length,
              itemBuilder: (context, index) {
                final castEntity = state.casts[index];
                return CastItem(castEntity: castEntity);
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}