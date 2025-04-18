import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '../../features/create_new_task/data/models/task_dto.dart';
import '../../features/create_new_task/view/create_new_task_screen.dart';
import '../../features/focus/view/focus_screen.dart';
import '../../features/home/view/home_screen.dart';
import '../../features/location_search/view/location_search_screen.dart';
import '../../features/profile/view/profile_screen.dart';
import '../../features/settings/view/settings_screen.dart';
import '../../features/task/view/task_screen.dart';
import '../../features/task_details/view/task_details_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes {
    return [
      /// routes go here
      AutoRoute(
        page: HomeRoute.page,
        path: '/',
        children: [
          AutoRoute(page: IndexRoute.page, path: 'task'),
          AutoRoute(page: CalendarRoute.page, path: 'settings'),
          AutoRoute(page: CreateNewTaskRoute.page, path: 'create_new_task'),
          AutoRoute(page: FocusRoute.page, path: 'focus'),
          AutoRoute(page: ProfileRoute.page, path: 'profile'),
          AutoRoute(page: CreateNewTaskRoute.page, path: 'edit_task'),
        ],
      ),
      AutoRoute(page: LocationSearchRoute.page, path: '/location_search'),
      AutoRoute(page: TaskDetailsRoute.page, path: '/task_details'),
    ];
  }
}
