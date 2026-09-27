import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:movie/presentation/provider/language_provider.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider/provider.dart';
import 'data/tables/movie_table.g.dart';
import 'di/get_it.dart' as getIt;
import 'presentation/movie_app.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
    unawaited(
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  } else {
    Hive.init(null);
  }
  Hive.registerAdapter(MovieTableAdapter());
  await getIt.init();
  runApp(
    ChangeNotifierProvider(
      create: (context) => LanguagesProvider(),
      child: MovieApp(),
    ),
  );
}
