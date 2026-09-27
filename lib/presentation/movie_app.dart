
import 'package:flutter/material.dart';
import 'package:movie/common/constants/route_constants.dart';
import 'package:movie/presentation/fade_page_route_builder.dart';
import 'package:movie/presentation/provider/language_provider.dart';
import 'package:movie/presentation/routes.dart';
import 'package:movie/presentation/wiredsh_app.dart';

import 'package:provider/provider.dart';
import 'package:movie/l10n/app_localizations.dart';
import 'package:wiredash/wiredash.dart';
import '../common/screenutil/screen_util.dart';
import 'journeys/home/home_screen.dart';
import 'themes/app_color.dart';
import 'themes/theme_text.dart';
class MovieApp extends StatefulWidget {
  @override
  _MovieAppState createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LanguagesProvider>(context);
    ScreenUtil.init();

    return WiredashApp(
      navigatorKey: _navigatorKey,
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Movie App',
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: AppColor.vulcan,
          hintColor: AppColor.royalBlue,
          scaffoldBackgroundColor: AppColor.vulcan,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: ThemeText.getTextTheme(),
          appBarTheme: const AppBarTheme(elevation: 0),
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: Locale(provider.currentLanguage),
        builder: (context, child) {
          return  child!;
        },
        initialRoute: RouteList.initial,
        onGenerateRoute:  (RouteSettings settings) {
          final routes = Routes.getRoutes(settings);
          final WidgetBuilder? builder = routes[settings.name];
          return FadePageRouteBuilder(builder!, settings);
        },

      ),
    );
  }

}