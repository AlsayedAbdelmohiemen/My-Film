import 'package:flutter/material.dart';
import 'package:wiredash/wiredash.dart';
import 'themes/app_color.dart';

class WiredashApp extends StatelessWidget {
  final navigatorKey;
  final Widget child;
  WiredashApp({required this.navigatorKey,required this.child });

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      projectId: 'movie-9u6ogwd',
      secret: 'burWbczFUd_SZT6OAQOicEVeTMupDKzi',

        child: child,

        theme: WiredashThemeData(
           brightness: Brightness.dark,
           primaryColor: AppColor.royalBlue,
           secondaryColor: AppColor.violet,
           secondaryBackgroundColor: AppColor.vulcan,

    ),



    );

  }


}
