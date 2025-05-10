// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [CalendarScreen]
class CalendarRoute extends PageRouteInfo<void> {
  const CalendarRoute({List<PageRouteInfo>? children})
    : super(CalendarRoute.name, initialChildren: children);

  static const String name = 'CalendarRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CalendarScreen();
    },
  );
}

/// generated route for
/// [CreateNewTaskScreen]
class CreateNewTaskRoute extends PageRouteInfo<CreateNewTaskRouteArgs> {
  CreateNewTaskRoute({
    Key? key,
    TaskDto? editTask,
    List<PageRouteInfo>? children,
  }) : super(
         CreateNewTaskRoute.name,
         args: CreateNewTaskRouteArgs(key: key, editTask: editTask),
         initialChildren: children,
       );

  static const String name = 'CreateNewTaskRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CreateNewTaskRouteArgs>(
        orElse: () => const CreateNewTaskRouteArgs(),
      );
      return CreateNewTaskScreen(key: args.key, editTask: args.editTask);
    },
  );
}

class CreateNewTaskRouteArgs {
  const CreateNewTaskRouteArgs({this.key, this.editTask});

  final Key? key;

  final TaskDto? editTask;

  @override
  String toString() {
    return 'CreateNewTaskRouteArgs{key: $key, editTask: $editTask}';
  }
}

/// generated route for
/// [FocusScreen]
class FocusRoute extends PageRouteInfo<void> {
  const FocusRoute({List<PageRouteInfo>? children})
    : super(FocusRoute.name, initialChildren: children);

  static const String name = 'FocusRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FocusScreen();
    },
  );
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        HomeRoute.name,
        args: HomeRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteArgs>(
        orElse: () => const HomeRouteArgs(),
      );
      return HomeScreen(key: args.key);
    },
  );
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [IndexScreen]
class IndexRoute extends PageRouteInfo<void> {
  const IndexRoute({List<PageRouteInfo>? children})
    : super(IndexRoute.name, initialChildren: children);

  static const String name = 'IndexRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IndexScreen();
    },
  );
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [SearchLocationScreen]
class SearchLocationRoute extends PageRouteInfo<void> {
  const SearchLocationRoute({List<PageRouteInfo>? children})
    : super(SearchLocationRoute.name, initialChildren: children);

  static const String name = 'SearchLocationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchLocationScreen();
    },
  );
}

/// generated route for
/// [TaskDetailsScreen]
class TaskDetailsRoute extends PageRouteInfo<TaskDetailsRouteArgs> {
  TaskDetailsRoute({
    Key? key,
    required TaskDto task,
    required void Function(TaskDto) onDelete,
    List<PageRouteInfo>? children,
  }) : super(
         TaskDetailsRoute.name,
         args: TaskDetailsRouteArgs(key: key, task: task, onDelete: onDelete),
         initialChildren: children,
       );

  static const String name = 'TaskDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TaskDetailsRouteArgs>();
      return TaskDetailsScreen(
        key: args.key,
        task: args.task,
        onDelete: args.onDelete,
      );
    },
  );
}

class TaskDetailsRouteArgs {
  const TaskDetailsRouteArgs({
    this.key,
    required this.task,
    required this.onDelete,
  });

  final Key? key;

  final TaskDto task;

  final void Function(TaskDto) onDelete;

  @override
  String toString() {
    return 'TaskDetailsRouteArgs{key: $key, task: $task, onDelete: $onDelete}';
  }
}
