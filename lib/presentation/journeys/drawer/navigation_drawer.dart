import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movie/l10n/app_localizations.dart';
import 'package:movie/common/constants/route_constants.dart';
import 'package:movie/common/constants/size_constants.dart';
import 'package:movie/presentation/provider/language_provider.dart';
import 'package:provider/provider.dart';
import 'package:wiredash/wiredash.dart';
import '../../widgets/app_dialog.dart';
import '../../widgets/logo.dart';
import '../favorite/favorite_screen.dart';
import 'navigation_list_item.dart';

class NavigationDrawerf extends StatelessWidget {
  const NavigationDrawerf();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          ),
        ],
      ),
      width: Sizes.dimen_300,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_8,
                bottom: Sizes.dimen_18,
                left: Sizes.dimen_8,
                right: Sizes.dimen_8,
              ),
              child: Logo(
                height: Sizes.dimen_20,
              ),
            ),
            NavigationListItem(
              title: AppLocalizations.of(context)!.favoriteMovies,
              onPressed: () {
                Navigator.of(context).pushNamed(RouteList.favorite);


              },
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    blurRadius: 2,
                  ),
                ],
              ),
              child: ExpansionTile(
                title: Text(AppLocalizations.of(context)!.language,style:TextStyle(color: Colors.white) ,),
                childrenPadding:
                    const EdgeInsets.only(left: 60), // children padding
                children: [
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.english,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onTap: () {
                      // Call the method to select English language from LanguagesProvider
                      Provider.of<LanguagesProvider>(context, listen: false)
                          .selectEnglishLanguage();
                    },
                  ),
                  ListTile(
                    title: Text(
                      AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    onTap: () {
                      // Call the method to select Arabic language from LanguagesProvider
                      Provider.of<LanguagesProvider>(context, listen: false)
                          .selectArabicLanguage();
                    },
                  ),
                  // Add more child menu items as needed
                ],
              ),
            ),
            NavigationListItem(
              title: AppLocalizations.of(context)!.feedback,
              onPressed: () {
                Navigator.of(context).pop();
                Wiredash.of(context).show();
              },
            ),
            NavigationListItem(
              title: AppLocalizations.of(context)!.about,
              onPressed: () {
                Navigator.of(context).pop();
                _showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        builder: (context) => AppDialog(
              title: AppLocalizations.of(context)!.about,
              description: AppLocalizations.of(context)!.aboutDescription,
              buttonText: AppLocalizations.of(context)!.okay,
              image: Image.asset(
                'assets/images/tmdb_logo.png',
                height: Sizes.dimen_48,
              ),
            ),
        context: context);
  }
}
