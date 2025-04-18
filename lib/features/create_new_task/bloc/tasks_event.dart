part of 'tasks_bloc.dart';

@immutable
sealed class TasksEvent {}

class LoadTasksEvent extends TasksEvent {}

class AddTaskEvent extends TasksEvent {
  AddTaskEvent(
      this.taskTitle,
      this.taskType,
      this.taskPriority,
      this.taskDeadline,
      this.taskDescription,
      this.taskLocation,
      this.taskRemindTime,
      );

  final String taskTitle;
  final TaskTypesEnum? taskType;
  final int? taskPriority;
  final DateTime? taskDeadline;
  final String? taskDescription;
  final LocationDetailsModel? taskLocation;
  final List<DateTime>? taskRemindTime;
}

class DeleteTaskEvent extends TasksEvent {
  DeleteTaskEvent(
      this.taskDelete,
      );

  final TaskDto taskDelete;
}

class EditTaskEvent extends TasksEvent {
  EditTaskEvent({
    required this.oldTask,
    required this.taskTitle,
    this.taskType,
    this.taskPriority,
    this.taskDeadline,
    this.taskDescription,
    this.taskLocation,
    this.taskRemindTime,
  });

  final TaskDto oldTask;
  final String taskTitle;
  final TaskTypesEnum? taskType;
  final int? taskPriority;
  final DateTime? taskDeadline;
  final String? taskDescription;
  final LocationDetailsModel? taskLocation;
  final List<DateTime>? taskRemindTime;
}

class SearchTaskEvent extends TasksEvent {
  SearchTaskEvent(
      this.query,
      );

  final String query;
}

class SortTasksEvent extends TasksEvent {
  SortTasksEvent(
      this.sortingOption,
      );

  final SortingOptionsEnum sortingOption;
}
