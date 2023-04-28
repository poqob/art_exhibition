import 'package:art_exhibition/screens/settings/options/OptionAccountSettingsChangePassword.dart';
import 'package:art_exhibition/screens/settings/options/OptionAccountSettingsChangeUsername.dart';
import 'package:flutter/material.dart';

class AccountSettingsView extends StatefulWidget {
  const AccountSettingsView({super.key});

  @override
  State<AccountSettingsView> createState() => _AccountSettingsViewState();
}

class _AccountSettingsViewState extends State<AccountSettingsView> {
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
          changePassword(context),
          changeUsername(context),
        ],
      ),
    );
  }
}
