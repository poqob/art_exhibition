import 'package:art_exhibition/screens/artists/artist_view.dart';
import 'package:art_exhibition/screens/authentaticion/authentaticion_login_view.dart';
import 'package:art_exhibition/screens/authentaticion/authentaticion_signup_view.dart';
import 'package:art_exhibition/screens/entrance/entrance_view.dart';
import 'package:art_exhibition/screens/home/home.dart';
import 'package:art_exhibition/screens/museums/museums_view.dart';
import 'package:art_exhibition/screens/saved/saved.dart';
import 'package:art_exhibition/screens/settings/settings_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const EntranceScreen(),
  '/login': (context) => const LogIn(),
  '/signup': (context) => const SignUp(),
  '/home': (context) => Home(),
  '/settings': (context) => const SettingsScreen(),
  '/saved': (context) => const SavedScreen(),
  '/museums': (context) => const MuseumView(),
  '/artists': (context) => const ArtistView(),
};
