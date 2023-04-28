import 'package:art_exhibition/screens/settings/options/OptionAccountSettingsChangePassword.dart';
import 'package:art_exhibition/screens/settings/options/OptionAccountSettingsChangeUsername.dart';
import 'package:flutter/material.dart';

class AccountSettingsView extends StatelessWidget {
  const AccountSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Settings",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          changeUsername(context),
          changePassword(context),
        ],
      ),
    );
  }
}
