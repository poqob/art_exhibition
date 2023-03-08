import 'package:art_exhibition/screens/authentaticion/authentaticion_login_view.dart';
import 'package:art_exhibition/screens/authentaticion/authentaticion_signup_view.dart';
import 'package:art_exhibition/screens/content_page/multi_content_page.dart';
import 'package:art_exhibition/screens/content_page/single_content_page.dart';
import 'package:art_exhibition/screens/entrance/entrance_view.dart';
import 'package:art_exhibition/screens/home/home.dart';
import 'package:art_exhibition/screens/settings/settings_page.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const EntranceScreen(),
  '/login': (context) => const LogIn(),
  '/signup': (context) => const SignUp(),
  '/home': (context) => Home(),
  '/scontent': (context) => const SingleContentPage(),
  '/mcontent': (context) => const MultiContentPage(),
  '/settings': (context) => const SettingsScreen(),
};
