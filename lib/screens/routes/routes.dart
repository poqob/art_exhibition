import 'package:art_exhibition/screens/authentaticion/authentaticion_login.dart';
import 'package:art_exhibition/screens/entrance/entrance_view.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => const EntranceScreen(),
  '/auth': (context) => const LogIn(),
};
