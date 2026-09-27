// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get favoriteMovies => 'Favorite Movies';

  @override
  String get language => 'Language';

  @override
  String get feedback => 'Feedback';

  @override
  String get about => 'About';

  @override
  String get english => 'English';

  @override
  String get arabic => 'Arabic';

  @override
  String get popular => 'POPULAR';

  @override
  String get now => 'NOW';

  @override
  String get soon => 'SOON';

  @override
  String get okay => 'Okay';

  @override
  String get aboutDescription => 'Thank God';

  @override
  String get somethingWentWrong => 'Something went wrong...';

  @override
  String get checkNetwork =>
      'Please check your network connection and press Retry button or put in as a bug by pressing Feedback button.';

  @override
  String get retry => 'Retry';

  @override
  String get noMovies => 'Sorry, no movies under this section';

  @override
  String get cast => 'Cast';

  @override
  String get watchTrailers => 'Watch Trailers';

  @override
  String get search => 'Search';

  @override
  String get noFavoriteMovie => 'No Favorite Movie';

  @override
  String get noMoviesSearched =>
      'No movies found, please search with another word';
}
