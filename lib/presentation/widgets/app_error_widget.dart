import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:movie/l10n/app_localizations.dart';
import 'package:movie/common/constants/size_constants.dart';
import 'package:movie/domain/enities/app_error.dart';
import 'package:movie/presentation/widgets/button.dart';

import 'package:wiredash/wiredash.dart';


class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function onPressed;

  const AppErrorWidget({

    required this.errorType,
    required this.onPressed,
  }) ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? AppLocalizations.of(context)!.somethingWentWrong
                : AppLocalizations.of(context)!.checkNetwork,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                onPressed: onPressed,
                text: AppLocalizations.of(context)!.retry,
              ),
              SizedBox(width: 16),
              Button(
                onPressed: () => Wiredash.of(context).show(),
                text: AppLocalizations.of(context)!.feedback,
              ),
            ],
          )
        ],
      ),
    );
  }
}