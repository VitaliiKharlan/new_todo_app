import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '../../../core/theme/app_images.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Profile',
            style: theme.appBarTheme.titleTextStyle,
            textAlign: TextAlign.center,
          ),
        ),
        flexibleSpace: ClipRect(
          child: Stack(
            children: [
              Positioned.fill(
                child: Image.asset(
                  AppImages.backgroundImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: kToolbarHeight,
                ),
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(color: Colors.black.withAlpha(30)),
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: kToolbarHeight,
      ),

      body: Container(color: Colors.blue),
    );
  }
}
