import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/task_dto.dart';

part 'tasks_state.freezed.dart';

@freezed
class TasksState with _$TasksState {
  const factory TasksState.initial() = InitialTasksState;

  const factory TasksState.addNewTaskLoading() = AddNewTaskLoadingState;

  const factory TasksState.tasksLoaded(List<TaskDto> tasks) = TasksLoadedState;

  const factory TasksState.tasksLoadingFailure(Object? exception) =
      TasksLoadingFailureState;

  const factory TasksState.tasksDeletingFailure(Object? exception) =
      TasksDeletingFailureState;

  const factory TasksState.tasksEditingFailure(Object? exception) =
      TasksEditingFailureState;
}
