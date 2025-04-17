import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../core/router/router.dart';
import '../../create_new_task/bloc/tasks_bloc.dart';
import '../../create_new_task/data/repositories/task_repository.dart';
import '../widgets/custom_bottom_nav_bar.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final taskRepository = TaskRepository();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AutoTabsRouter(
      routes: [
        IndexRoute(),
        CalendarRoute(),
        CreateNewTaskRoute(),
        FocusRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create:
                  (context) =>
                      TasksBloc(taskRepository: taskRepository)
                        ..add(LoadTasksEvent()),
            ),
          ],
          child: Scaffold(
            backgroundColor: theme.colorScheme.surface,
            body: child,
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) => _openPage(index, tabsRouter),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _openPage(2, tabsRouter),
              backgroundColor: theme.primaryColor,
              shape: CircleBorder(),
              child: Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}

