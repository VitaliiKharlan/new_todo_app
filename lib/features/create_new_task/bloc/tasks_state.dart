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

// sealed class TasksState extends Equatable {}
//
// final class InitialTasksState extends TasksState {
//   @override
//   List<Object?> get props => [];
// }
//
// class AddNewTaskLoadingState extends TasksState {
//   @override
//   List<Object?> get props => [];
// }
//
// class TasksLoadedState extends TasksState {
//   TasksLoadedState(
//       this.tasks,
//       );
//
//   final List<TaskDto> tasks;
//
//   @override
//   List<Object?> get props => [tasks];
// }
//
// class TasksLoadingFailureState extends TasksState {
//   TasksLoadingFailureState(
//       this.exception,
//       );
//
//   final Object? exception;
//
//   @override
//   List<Object?> get props => [exception];
// }
//
// class TasksDeletingFailureState extends TasksState {
//   TasksDeletingFailureState(
//       this.exception,
//       );
//
//   final Object? exception;
//
//   @override
//   List<Object?> get props => [exception];
// }
//
// class TasksEditingFailureState extends TasksState {
//   final Object? exception;
//
//   TasksEditingFailureState(this.exception);
//
//   @override
//   List<Object?> get props => [exception];
// }
