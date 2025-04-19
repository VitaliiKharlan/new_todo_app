// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TasksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksState()';
}


}

/// @nodoc
class $TasksStateCopyWith<$Res>  {
$TasksStateCopyWith(TasksState _, $Res Function(TasksState) __);
}


/// @nodoc


class InitialTasksState implements TasksState {
  const InitialTasksState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InitialTasksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksState.initial()';
}


}




/// @nodoc


class AddNewTaskLoadingState implements TasksState {
  const AddNewTaskLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddNewTaskLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksState.addNewTaskLoading()';
}


}




/// @nodoc


class TasksLoadedState implements TasksState {
  const TasksLoadedState(final  List<TaskDto> tasks): _tasks = tasks;
  

 final  List<TaskDto> _tasks;
 List<TaskDto> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksLoadedStateCopyWith<TasksLoadedState> get copyWith => _$TasksLoadedStateCopyWithImpl<TasksLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksLoadedState&&const DeepCollectionEquality().equals(other._tasks, _tasks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks));

@override
String toString() {
  return 'TasksState.tasksLoaded(tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class $TasksLoadedStateCopyWith<$Res> implements $TasksStateCopyWith<$Res> {
  factory $TasksLoadedStateCopyWith(TasksLoadedState value, $Res Function(TasksLoadedState) _then) = _$TasksLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<TaskDto> tasks
});




}
/// @nodoc
class _$TasksLoadedStateCopyWithImpl<$Res>
    implements $TasksLoadedStateCopyWith<$Res> {
  _$TasksLoadedStateCopyWithImpl(this._self, this._then);

  final TasksLoadedState _self;
  final $Res Function(TasksLoadedState) _then;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tasks = null,}) {
  return _then(TasksLoadedState(
null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskDto>,
  ));
}


}

/// @nodoc


class TasksLoadingFailureState implements TasksState {
  const TasksLoadingFailureState(this.exception);
  

 final  Object? exception;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksLoadingFailureStateCopyWith<TasksLoadingFailureState> get copyWith => _$TasksLoadingFailureStateCopyWithImpl<TasksLoadingFailureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksLoadingFailureState&&const DeepCollectionEquality().equals(other.exception, exception));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(exception));

@override
String toString() {
  return 'TasksState.tasksLoadingFailure(exception: $exception)';
}


}

/// @nodoc
abstract mixin class $TasksLoadingFailureStateCopyWith<$Res> implements $TasksStateCopyWith<$Res> {
  factory $TasksLoadingFailureStateCopyWith(TasksLoadingFailureState value, $Res Function(TasksLoadingFailureState) _then) = _$TasksLoadingFailureStateCopyWithImpl;
@useResult
$Res call({
 Object? exception
});




}
/// @nodoc
class _$TasksLoadingFailureStateCopyWithImpl<$Res>
    implements $TasksLoadingFailureStateCopyWith<$Res> {
  _$TasksLoadingFailureStateCopyWithImpl(this._self, this._then);

  final TasksLoadingFailureState _self;
  final $Res Function(TasksLoadingFailureState) _then;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = freezed,}) {
  return _then(TasksLoadingFailureState(
freezed == exception ? _self.exception : exception ,
  ));
}


}

/// @nodoc


class TasksDeletingFailureState implements TasksState {
  const TasksDeletingFailureState(this.exception);
  

 final  Object? exception;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksDeletingFailureStateCopyWith<TasksDeletingFailureState> get copyWith => _$TasksDeletingFailureStateCopyWithImpl<TasksDeletingFailureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksDeletingFailureState&&const DeepCollectionEquality().equals(other.exception, exception));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(exception));

@override
String toString() {
  return 'TasksState.tasksDeletingFailure(exception: $exception)';
}


}

/// @nodoc
abstract mixin class $TasksDeletingFailureStateCopyWith<$Res> implements $TasksStateCopyWith<$Res> {
  factory $TasksDeletingFailureStateCopyWith(TasksDeletingFailureState value, $Res Function(TasksDeletingFailureState) _then) = _$TasksDeletingFailureStateCopyWithImpl;
@useResult
$Res call({
 Object? exception
});




}
/// @nodoc
class _$TasksDeletingFailureStateCopyWithImpl<$Res>
    implements $TasksDeletingFailureStateCopyWith<$Res> {
  _$TasksDeletingFailureStateCopyWithImpl(this._self, this._then);

  final TasksDeletingFailureState _self;
  final $Res Function(TasksDeletingFailureState) _then;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = freezed,}) {
  return _then(TasksDeletingFailureState(
freezed == exception ? _self.exception : exception ,
  ));
}


}

/// @nodoc


class TasksEditingFailureState implements TasksState {
  const TasksEditingFailureState(this.exception);
  

 final  Object? exception;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksEditingFailureStateCopyWith<TasksEditingFailureState> get copyWith => _$TasksEditingFailureStateCopyWithImpl<TasksEditingFailureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksEditingFailureState&&const DeepCollectionEquality().equals(other.exception, exception));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(exception));

@override
String toString() {
  return 'TasksState.tasksEditingFailure(exception: $exception)';
}


}

/// @nodoc
abstract mixin class $TasksEditingFailureStateCopyWith<$Res> implements $TasksStateCopyWith<$Res> {
  factory $TasksEditingFailureStateCopyWith(TasksEditingFailureState value, $Res Function(TasksEditingFailureState) _then) = _$TasksEditingFailureStateCopyWithImpl;
@useResult
$Res call({
 Object? exception
});




}
/// @nodoc
class _$TasksEditingFailureStateCopyWithImpl<$Res>
    implements $TasksEditingFailureStateCopyWith<$Res> {
  _$TasksEditingFailureStateCopyWithImpl(this._self, this._then);

  final TasksEditingFailureState _self;
  final $Res Function(TasksEditingFailureState) _then;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exception = freezed,}) {
  return _then(TasksEditingFailureState(
freezed == exception ? _self.exception : exception ,
  ));
}


}

// dart format on
