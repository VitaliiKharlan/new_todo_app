// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TasksEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksEvent()';
}


}

/// @nodoc
class $TasksEventCopyWith<$Res>  {
$TasksEventCopyWith(TasksEvent _, $Res Function(TasksEvent) __);
}


/// @nodoc


class LoadTasksEvent implements TasksEvent {
  const LoadTasksEvent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTasksEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksEvent.loadTasks()';
}


}




/// @nodoc


class AddTaskEvent implements TasksEvent {
  const AddTaskEvent({required this.taskTitle, required this.taskType, required this.taskPriority, required this.taskDeadline, required this.taskDescription, required this.taskLocation, required final  List<DateTime>? taskRemindTime}): _taskRemindTime = taskRemindTime;
  

 final  String taskTitle;
 final  TaskTypesEnum? taskType;
 final  int? taskPriority;
 final  DateTime? taskDeadline;
 final  String? taskDescription;
 final  LocationDetailsModel? taskLocation;
 final  List<DateTime>? _taskRemindTime;
 List<DateTime>? get taskRemindTime {
  final value = _taskRemindTime;
  if (value == null) return null;
  if (_taskRemindTime is EqualUnmodifiableListView) return _taskRemindTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTaskEventCopyWith<AddTaskEvent> get copyWith => _$AddTaskEventCopyWithImpl<AddTaskEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTaskEvent&&(identical(other.taskTitle, taskTitle) || other.taskTitle == taskTitle)&&(identical(other.taskType, taskType) || other.taskType == taskType)&&(identical(other.taskPriority, taskPriority) || other.taskPriority == taskPriority)&&(identical(other.taskDeadline, taskDeadline) || other.taskDeadline == taskDeadline)&&(identical(other.taskDescription, taskDescription) || other.taskDescription == taskDescription)&&(identical(other.taskLocation, taskLocation) || other.taskLocation == taskLocation)&&const DeepCollectionEquality().equals(other._taskRemindTime, _taskRemindTime));
}


@override
int get hashCode => Object.hash(runtimeType,taskTitle,taskType,taskPriority,taskDeadline,taskDescription,taskLocation,const DeepCollectionEquality().hash(_taskRemindTime));

@override
String toString() {
  return 'TasksEvent.addTask(taskTitle: $taskTitle, taskType: $taskType, taskPriority: $taskPriority, taskDeadline: $taskDeadline, taskDescription: $taskDescription, taskLocation: $taskLocation, taskRemindTime: $taskRemindTime)';
}


}

/// @nodoc
abstract mixin class $AddTaskEventCopyWith<$Res> implements $TasksEventCopyWith<$Res> {
  factory $AddTaskEventCopyWith(AddTaskEvent value, $Res Function(AddTaskEvent) _then) = _$AddTaskEventCopyWithImpl;
@useResult
$Res call({
 String taskTitle, TaskTypesEnum? taskType, int? taskPriority, DateTime? taskDeadline, String? taskDescription, LocationDetailsModel? taskLocation, List<DateTime>? taskRemindTime
});




}
/// @nodoc
class _$AddTaskEventCopyWithImpl<$Res>
    implements $AddTaskEventCopyWith<$Res> {
  _$AddTaskEventCopyWithImpl(this._self, this._then);

  final AddTaskEvent _self;
  final $Res Function(AddTaskEvent) _then;

/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskTitle = null,Object? taskType = freezed,Object? taskPriority = freezed,Object? taskDeadline = freezed,Object? taskDescription = freezed,Object? taskLocation = freezed,Object? taskRemindTime = freezed,}) {
  return _then(AddTaskEvent(
taskTitle: null == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String,taskType: freezed == taskType ? _self.taskType : taskType // ignore: cast_nullable_to_non_nullable
as TaskTypesEnum?,taskPriority: freezed == taskPriority ? _self.taskPriority : taskPriority // ignore: cast_nullable_to_non_nullable
as int?,taskDeadline: freezed == taskDeadline ? _self.taskDeadline : taskDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,taskDescription: freezed == taskDescription ? _self.taskDescription : taskDescription // ignore: cast_nullable_to_non_nullable
as String?,taskLocation: freezed == taskLocation ? _self.taskLocation : taskLocation // ignore: cast_nullable_to_non_nullable
as LocationDetailsModel?,taskRemindTime: freezed == taskRemindTime ? _self._taskRemindTime : taskRemindTime // ignore: cast_nullable_to_non_nullable
as List<DateTime>?,
  ));
}


}

/// @nodoc


class EditTaskEvent implements TasksEvent {
  const EditTaskEvent({required this.oldTask, required this.taskTitle, required this.taskType, required this.taskPriority, required this.taskDeadline, required this.taskDescription, required this.taskLocation, required final  List<DateTime>? taskRemindTime}): _taskRemindTime = taskRemindTime;
  

 final  TaskDto oldTask;
 final  String taskTitle;
 final  TaskTypesEnum? taskType;
 final  int? taskPriority;
 final  DateTime? taskDeadline;
 final  String? taskDescription;
 final  LocationDetailsModel? taskLocation;
 final  List<DateTime>? _taskRemindTime;
 List<DateTime>? get taskRemindTime {
  final value = _taskRemindTime;
  if (value == null) return null;
  if (_taskRemindTime is EqualUnmodifiableListView) return _taskRemindTime;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditTaskEventCopyWith<EditTaskEvent> get copyWith => _$EditTaskEventCopyWithImpl<EditTaskEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EditTaskEvent&&(identical(other.oldTask, oldTask) || other.oldTask == oldTask)&&(identical(other.taskTitle, taskTitle) || other.taskTitle == taskTitle)&&(identical(other.taskType, taskType) || other.taskType == taskType)&&(identical(other.taskPriority, taskPriority) || other.taskPriority == taskPriority)&&(identical(other.taskDeadline, taskDeadline) || other.taskDeadline == taskDeadline)&&(identical(other.taskDescription, taskDescription) || other.taskDescription == taskDescription)&&(identical(other.taskLocation, taskLocation) || other.taskLocation == taskLocation)&&const DeepCollectionEquality().equals(other._taskRemindTime, _taskRemindTime));
}


@override
int get hashCode => Object.hash(runtimeType,oldTask,taskTitle,taskType,taskPriority,taskDeadline,taskDescription,taskLocation,const DeepCollectionEquality().hash(_taskRemindTime));

@override
String toString() {
  return 'TasksEvent.editTask(oldTask: $oldTask, taskTitle: $taskTitle, taskType: $taskType, taskPriority: $taskPriority, taskDeadline: $taskDeadline, taskDescription: $taskDescription, taskLocation: $taskLocation, taskRemindTime: $taskRemindTime)';
}


}

/// @nodoc
abstract mixin class $EditTaskEventCopyWith<$Res> implements $TasksEventCopyWith<$Res> {
  factory $EditTaskEventCopyWith(EditTaskEvent value, $Res Function(EditTaskEvent) _then) = _$EditTaskEventCopyWithImpl;
@useResult
$Res call({
 TaskDto oldTask, String taskTitle, TaskTypesEnum? taskType, int? taskPriority, DateTime? taskDeadline, String? taskDescription, LocationDetailsModel? taskLocation, List<DateTime>? taskRemindTime
});




}
/// @nodoc
class _$EditTaskEventCopyWithImpl<$Res>
    implements $EditTaskEventCopyWith<$Res> {
  _$EditTaskEventCopyWithImpl(this._self, this._then);

  final EditTaskEvent _self;
  final $Res Function(EditTaskEvent) _then;

/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldTask = null,Object? taskTitle = null,Object? taskType = freezed,Object? taskPriority = freezed,Object? taskDeadline = freezed,Object? taskDescription = freezed,Object? taskLocation = freezed,Object? taskRemindTime = freezed,}) {
  return _then(EditTaskEvent(
oldTask: null == oldTask ? _self.oldTask : oldTask // ignore: cast_nullable_to_non_nullable
as TaskDto,taskTitle: null == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String,taskType: freezed == taskType ? _self.taskType : taskType // ignore: cast_nullable_to_non_nullable
as TaskTypesEnum?,taskPriority: freezed == taskPriority ? _self.taskPriority : taskPriority // ignore: cast_nullable_to_non_nullable
as int?,taskDeadline: freezed == taskDeadline ? _self.taskDeadline : taskDeadline // ignore: cast_nullable_to_non_nullable
as DateTime?,taskDescription: freezed == taskDescription ? _self.taskDescription : taskDescription // ignore: cast_nullable_to_non_nullable
as String?,taskLocation: freezed == taskLocation ? _self.taskLocation : taskLocation // ignore: cast_nullable_to_non_nullable
as LocationDetailsModel?,taskRemindTime: freezed == taskRemindTime ? _self._taskRemindTime : taskRemindTime // ignore: cast_nullable_to_non_nullable
as List<DateTime>?,
  ));
}


}

/// @nodoc


class DeleteTaskEvent implements TasksEvent {
  const DeleteTaskEvent({required this.taskDelete});
  

 final  TaskDto taskDelete;

/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteTaskEventCopyWith<DeleteTaskEvent> get copyWith => _$DeleteTaskEventCopyWithImpl<DeleteTaskEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteTaskEvent&&(identical(other.taskDelete, taskDelete) || other.taskDelete == taskDelete));
}


@override
int get hashCode => Object.hash(runtimeType,taskDelete);

@override
String toString() {
  return 'TasksEvent.deleteTask(taskDelete: $taskDelete)';
}


}

/// @nodoc
abstract mixin class $DeleteTaskEventCopyWith<$Res> implements $TasksEventCopyWith<$Res> {
  factory $DeleteTaskEventCopyWith(DeleteTaskEvent value, $Res Function(DeleteTaskEvent) _then) = _$DeleteTaskEventCopyWithImpl;
@useResult
$Res call({
 TaskDto taskDelete
});




}
/// @nodoc
class _$DeleteTaskEventCopyWithImpl<$Res>
    implements $DeleteTaskEventCopyWith<$Res> {
  _$DeleteTaskEventCopyWithImpl(this._self, this._then);

  final DeleteTaskEvent _self;
  final $Res Function(DeleteTaskEvent) _then;

/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? taskDelete = null,}) {
  return _then(DeleteTaskEvent(
taskDelete: null == taskDelete ? _self.taskDelete : taskDelete // ignore: cast_nullable_to_non_nullable
as TaskDto,
  ));
}


}

/// @nodoc


class SearchTaskEvent implements TasksEvent {
  const SearchTaskEvent(this.query);
  

 final  String query;

/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchTaskEventCopyWith<SearchTaskEvent> get copyWith => _$SearchTaskEventCopyWithImpl<SearchTaskEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchTaskEvent&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'TasksEvent.searchTask(query: $query)';
}


}

/// @nodoc
abstract mixin class $SearchTaskEventCopyWith<$Res> implements $TasksEventCopyWith<$Res> {
  factory $SearchTaskEventCopyWith(SearchTaskEvent value, $Res Function(SearchTaskEvent) _then) = _$SearchTaskEventCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$SearchTaskEventCopyWithImpl<$Res>
    implements $SearchTaskEventCopyWith<$Res> {
  _$SearchTaskEventCopyWithImpl(this._self, this._then);

  final SearchTaskEvent _self;
  final $Res Function(SearchTaskEvent) _then;

/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(SearchTaskEvent(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SortTasksEvent implements TasksEvent {
  const SortTasksEvent(this.sortingOption);
  

 final  SortingOptionsEnum sortingOption;

/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SortTasksEventCopyWith<SortTasksEvent> get copyWith => _$SortTasksEventCopyWithImpl<SortTasksEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SortTasksEvent&&(identical(other.sortingOption, sortingOption) || other.sortingOption == sortingOption));
}


@override
int get hashCode => Object.hash(runtimeType,sortingOption);

@override
String toString() {
  return 'TasksEvent.sortTasks(sortingOption: $sortingOption)';
}


}

/// @nodoc
abstract mixin class $SortTasksEventCopyWith<$Res> implements $TasksEventCopyWith<$Res> {
  factory $SortTasksEventCopyWith(SortTasksEvent value, $Res Function(SortTasksEvent) _then) = _$SortTasksEventCopyWithImpl;
@useResult
$Res call({
 SortingOptionsEnum sortingOption
});




}
/// @nodoc
class _$SortTasksEventCopyWithImpl<$Res>
    implements $SortTasksEventCopyWith<$Res> {
  _$SortTasksEventCopyWithImpl(this._self, this._then);

  final SortTasksEvent _self;
  final $Res Function(SortTasksEvent) _then;

/// Create a copy of TasksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sortingOption = null,}) {
  return _then(SortTasksEvent(
null == sortingOption ? _self.sortingOption : sortingOption // ignore: cast_nullable_to_non_nullable
as SortingOptionsEnum,
  ));
}


}

// dart format on
