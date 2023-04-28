import 'package:art_exhibition/screens/artists/grid_view/grid_view.dart';
import 'package:art_exhibition/screens/arts/grid_view/grid_view.dart';
import 'package:art_exhibition/screens/authentaticion/authentaticion_login_view.dart';
import 'package:art_exhibition/screens/authentaticion/authentaticion_signup_view.dart';
import 'package:art_exhibition/screens/entrance/entrance_view.dart';
import 'package:art_exhibition/screens/home/home.dart';
import 'package:art_exhibition/screens/museums/grid_view/grid_view.dart';
import 'package:art_exhibition/screens/saved/grid_view/grid_view.dart';
import 'package:art_exhibition/screens/settings/settings_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const EntranceScreen(),
  '/login': (context) => const LogIn(),
  '/signup': (context) => const SignUp(),
  '/home': (context) => Home(),
  '/settings': (context) => const SettingsScreen(),
  '/saved': (context) => const SavedView2(),
  '/museums': (context) => const MuseumView2(),
  '/artists': (context) => const ArtistView2(),
  '/arts': (context) => const ArtsPageView(),
};
