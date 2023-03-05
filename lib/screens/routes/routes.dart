import 'package:art_exhibition/screens/authentaticion/authentaticion_login_view.dart';
import 'package:art_exhibition/screens/authentaticion/authentaticion_signup_view.dart';
import 'package:art_exhibition/screens/entrance/entrance_view.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const EntranceScreen(),
  '/login': (context) => const LogIn(),
  '/signup': (context) => const SignUp(),
};
