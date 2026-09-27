import 'package:movie/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:movie/common/constants/size_constants.dart';
import 'package:movie/presentation/widgets/button.dart';


import '../themes/app_color.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget image;

  const AppDialog({

    required this.title,
    required this.description,
    required this.buttonText,
    required this.image,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(Sizes.dimen_8),
        ),
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_4,
          left: Sizes.dimen_16,
          right: Sizes.dimen_16,
        ),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.vulcan,
              blurRadius: Sizes.dimen_16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            if (image != null) image,
            Button(
              onPressed: () {
                Navigator.of(context).pop();
              },
              text: AppLocalizations.of(context)!.okay,
              style: Theme.of(context).textTheme.labelLarge,

            ),
          ],
        ),
      ),
    );
  }
}