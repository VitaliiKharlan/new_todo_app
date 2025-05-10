import 'package:flutter/material.dart';

import 'dart:ui';
import 'package:auto_route/auto_route.dart';

import '../../../core/theme/app_images.dart';
import '../widgets/settings_action_card.dart';
import '../widgets/settings_toggle_card.dart';

@RoutePage()
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

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
            'Calendar',
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Dark Theme',
              value: true,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Notifications',
              value: true,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsToggleCard(
              title: 'Analytics',
              value: true,
              onChanged: (value) {},
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 48)),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Clear History',
              onTap: () {},
              iconData: Icons.delete,
              iconColor: Theme.of(context).primaryColor,
            ),
          ),
          SliverToBoxAdapter(
            child: SettingsActionCard(
              title: 'Support',
              onTap: () {},
              iconData: Icons.message,
            ),
          ),
        ],
      ),
    );
  }
}
