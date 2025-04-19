import 'package:equatable/equatable.dart';

import '../../../../core/enums/task_types_enum.dart';
import '../../../location_search/data/models/location_details.dart';
import '../../widgets/task_progress_indicator.dart';

class TaskDto extends Equatable {
  TaskDto({
    required this.taskId,
    required this.taskTitle,
    required this.taskType,
    required this.taskPriority,
    required this.taskDeadline,
    required this.taskDescription,
    required this.taskLocation,
    DateTime? createdAt,
    required this.taskRemindTime,
  }) : taskCreatedAt = createdAt ?? DateTime.now();

  final String taskId;
  final String taskTitle;
  final TaskTypesEnum? taskType;
  final int? taskPriority;
  final DateTime? taskDeadline;
  final String? taskDescription;
  final LocationDetailsModel? taskLocation;
  final List<DateTime>? taskRemindTime;
  final DateTime taskCreatedAt;

  double get progress {
    if (taskDeadline == null) return 100;
    double progress = TaskProgressIndicator.calculateProgress(
      taskCreatedAt,
      taskDeadline!,
    );
    return progress;
  }

  Map<String, dynamic> toMap() {
    return {
      'taskId': taskId,
      'taskTitle': taskTitle,
      'taskDescription': taskDescription,
      'taskType': taskType?.name,
      'taskPriority': taskPriority,
      'taskLocation': taskLocation?.toJson(),
      'taskCreatedAt': taskCreatedAt.toIso8601String(),
      'taskDeadline': taskDeadline?.toIso8601String(),
      'taskRemindTime':
          taskRemindTime?.map((e) => e.toIso8601String()).toList(),
    };
  }

  factory TaskDto.fromMap(Map<String, dynamic> map) {
    return TaskDto(
      taskTitle: map['taskTitle'],
      taskType:
          map['taskType'] != null
              ? TaskTypeExtension.fromString(map['taskType'])
              : null,
      taskPriority:
          map['taskPriority'] != null ? map['taskPriority'] as int : null,
      taskLocation:
          map['taskLocation'] != null
              ? LocationDetailsModel.fromJson(map['taskLocation'])
              : null,
      createdAt:
          map['taskCreatedAt'] != null
              ? DateTime.parse(map['taskCreatedAt'])
              : null,
      taskDeadline:
          map['taskDeadline'] != null
              ? DateTime.parse(map['taskDeadline'])
              : null,
      taskDescription: map['taskDescription'],
      taskRemindTime:
          map['taskRemindTime'] != null
              ? (map['taskRemindTime'] is List<dynamic>
                  ? (map['taskRemindTime'] as List<dynamic>)
                      .map((e) => DateTime.parse(e as String))
                      .toList()
                  : [DateTime.parse(map['taskRemindTime'] as String)])
              : [],
      taskId: map['taskId'],
    );
  }

  @override
  List<Object?> get props => [
    taskId,
    taskTitle,
    taskType,
    taskPriority,
    taskDeadline,
    taskDescription,
    taskLocation,
  ];

  TaskDto copyWith({
    String? taskId,
    String? taskTitle,
    String? taskDescription,
    TaskTypesEnum? taskType,
    int? taskPriority,
    LocationDetailsModel? taskLocation,
    DateTime? taskDeadline,
    List<DateTime>? taskRemindTime,
    DateTime? taskCreatedAt,
  }) {
    return TaskDto(
      taskId: taskId ?? this.taskId,
      taskTitle: taskTitle ?? this.taskTitle,
      taskDescription: taskDescription ?? this.taskDescription,
      taskType: taskType ?? this.taskType,
      taskPriority: taskPriority ?? this.taskPriority,
      taskLocation: taskLocation ?? this.taskLocation,
      taskDeadline: taskDeadline ?? this.taskDeadline,
      taskRemindTime: taskRemindTime ?? this.taskRemindTime,
      createdAt: taskCreatedAt ?? this.taskCreatedAt,
    );
  }

  @override
  String toString() {
    return 'Task(title: $taskTitle)';
  }
}

// import 'package:freezed_annotation/freezed_annotation.dart';
// import '../../../../core/enums/task_types_enum.dart';
// import '../../../location_search/data/models/location_details.dart';
//
// part 'task_dto.freezed.dart';
// part 'task_dto.g.dart';
//
// @freezed
// class TaskDto with _$TaskDto {
//   const factory TaskDto({
//     required String taskId,
//     required String taskTitle,
//     TaskTypesEnum? taskType,
//     int? taskPriority,
//     DateTime? taskDeadline,
//     String? taskDescription,
//     LocationDetailsModel? taskLocation,
//     List<DateTime>? taskRemindTime,
//     @Default(DateTime.now()) DateTime taskCreatedAt,
//   }) = _TaskDto;
//
//   // factory TaskDto.fromJson(Map<String, dynamic> json) =>
//   //     _$TaskDtoFromJson(json);
// }