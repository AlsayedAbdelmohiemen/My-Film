import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie/common/constants/size_constants.dart';
import 'package:movie/data/core/api_constants.dart';
import 'package:movie/domain/enities/cast_entity.dart';
import 'package:movie/presentation/themes/theme_text.dart';


class CastItem extends StatelessWidget {
  const CastItem({
    super.key,
    required this.castEntity,
  });

  final CastEntity castEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 160,
      child: Card(
        elevation: 1,
        margin: EdgeInsets.symmetric(
          horizontal: Sizes.dimen_16,

        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.dimen_8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(Sizes.dimen_8),
                ),
                child: CachedNetworkImage(
                  height: Sizes.dimen_160,
                  width: Sizes.dimen_150,
                  imageUrl:
                  '${ApiConstants.BASE_IMAGE_URL}${castEntity.posterPath}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.dimen_8,
              ),
              child: Text(
                castEntity.name,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: Theme.of(context).textTheme.vulcanBodyText2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: Sizes.dimen_8,
                right: Sizes.dimen_8,
                bottom: Sizes.dimen_2,
              ),
              child: Text(
                castEntity.character,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}