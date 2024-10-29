import 'package:annonceflash_project/shared/extensions/context_extensions.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Profiles Screen",
          style: context.textTheme.displayLarge,
        ),
      ),
    );
  }
}
