import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/enums/sorting_options_enum.dart';
import '../../../core/enums/task_types_enum.dart';
import '../../location_search/data/models/location_details.dart';
import '../data/models/task_dto.dart';

part 'tasks_event.freezed.dart';

@freezed
class TasksEvent with _$TasksEvent {
  const factory TasksEvent.loadTasks() = LoadTasksEvent;

  const factory TasksEvent.addTask({
    required String taskTitle,
    required TaskTypesEnum? taskType,
    required int? taskPriority,
    required DateTime? taskDeadline,
    required String? taskDescription,
    required LocationDetailsModel? taskLocation,
    required List<DateTime>? taskRemindTime,
  }) = AddTaskEvent;

  const factory TasksEvent.editTask({
    required TaskDto oldTask,
    required String taskTitle,
    required TaskTypesEnum? taskType,
    required int? taskPriority,
    required DateTime? taskDeadline,
    required String? taskDescription,
    required LocationDetailsModel? taskLocation,
    required List<DateTime>? taskRemindTime,
  }) = EditTaskEvent;

  const factory TasksEvent.deleteTask({required TaskDto taskDelete}) =
      DeleteTaskEvent;

  const factory TasksEvent.searchTask(String query) = SearchTaskEvent;

  const factory TasksEvent.sortTasks(SortingOptionsEnum sortingOption) =
      SortTasksEvent;
}
