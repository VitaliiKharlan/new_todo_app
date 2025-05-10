import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../core/enums/sorting_options_enum.dart';
import '../../../core/services/logger_service.dart';
import '../../create_new_task/bloc/tasks_state.dart';
import '../../create_new_task/bloc/tasks_event.dart';
import '../data/models/task_dto.dart';
import '../data/repositories/task_repository.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  final ITaskRepository taskRepository;
  List<TaskDto> _displayedTasks = [];
  SortingOptionsEnum _currentSortingOption =
      SortingOptionsEnum.createAtLastToFirst;

  void _sortTasksByCurrentOption() {
    if (_currentSortingOption == SortingOptionsEnum.priorityHighToLow) {
      _displayedTasks.sort((a, b) {
        final priorityA = a.taskPriority ?? 10;
        final priorityB = b.taskPriority ?? 10;
        return priorityA.compareTo(priorityB);
      });
    } else if (_currentSortingOption == SortingOptionsEnum.priorityLowToHigh) {
      _displayedTasks.sort((a, b) {
        final priorityA = a.taskPriority ?? 0;
        final priorityB = b.taskPriority ?? 0;
        return priorityB.compareTo(priorityA);
      });
    } else if (_currentSortingOption ==
        SortingOptionsEnum.createAtLastToFirst) {
      _displayedTasks.sort((a, b) {
        final taskCreateAtA = a.taskCreatedAt;
        final taskCreateAtB = b.taskCreatedAt;
        return taskCreateAtA.compareTo(taskCreateAtB);
      });
    } else if (_currentSortingOption ==
        SortingOptionsEnum.createAtFirstToLast) {
      _displayedTasks.sort((a, b) {
        final taskCreateAtA = a.taskCreatedAt;
        final taskCreateAtB = b.taskCreatedAt;
        return taskCreateAtB.compareTo(taskCreateAtA);
      });
    }
  }

  TasksBloc({required this.taskRepository}) : super(InitialTasksState()) {
    on<LoadTasksEvent>(_onLoadTasks);
    on<AddTaskEvent>(_onAddTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<EditTaskEvent>(_onEditTask);
    on<SearchTaskEvent>(_onSearchTask);
    on<SortTasksEvent>(_onSortTasks);
  }

  Future<void> _onLoadTasks(
    LoadTasksEvent event,
    Emitter<TasksState> emit,
  ) async {
    try {
      logger.i('Load Tasks Event');

      final tasksData = await taskRepository.fetchTasks();

      final tasks = tasksData.map((data) => TaskDto.fromMap(data)).toList();
      tasks.sort((a, b) => b.taskCreatedAt.compareTo(a.taskCreatedAt));
      _displayedTasks = tasks;
      _sortTasksByCurrentOption();

      emit(TasksLoadedState(tasks));
    } catch (e, s) {
      logger.e(
        'Unexpected error during loading tasks from Firestore',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  Future<void> _onAddTask(AddTaskEvent event, Emitter<TasksState> emit) async {
    try {
      logger.i('Add Task Event');

      List<TaskDto> tasks = [];
      final newTask = TaskDto(
        taskId: Uuid().v4(),
        taskTitle: event.taskTitle,
        taskType: event.taskType,
        taskPriority: event.taskPriority,
        taskDeadline: event.taskDeadline,
        taskDescription: event.taskDescription,
        taskLocation: event.taskLocation,
        taskRemindTime: event.taskRemindTime,
      );

      final taskMap = newTask.toMap();
      await taskRepository.addTask(taskMap);

      if (state is TasksLoadedState) {
        final currentTasks = (state as TasksLoadedState).tasks;
        tasks.addAll(currentTasks);
      }
      tasks.add(newTask);
      _displayedTasks = tasks;

      if (tasks.isNotEmpty) {
        tasks.sort((a, b) => b.taskCreatedAt.compareTo(a.taskCreatedAt));
      }

      emit(TasksLoadedState(tasks));
    } catch (e, s) {
      logger.e(
        'Unexpected error during adding new task to Firestore',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  Future<void> _onEditTask(
    EditTaskEvent event,
    Emitter<TasksState> emit,
  ) async {
    try {
      logger.i('Edit Task Event');

      if (state is TasksLoadedState) {
        final currentState = state as TasksLoadedState;

        final updatedTask = event.oldTask.copyWith(
          taskTitle: event.taskTitle,
          taskType: event.taskType,
          taskPriority: event.taskPriority,
          taskDeadline: event.taskDeadline,
          taskDescription: event.taskDescription,
          taskLocation: event.taskLocation,
          taskRemindTime: event.taskRemindTime,
        );

        await taskRepository.updateTask(
          updatedTask.taskId,
          updatedTask.toMap(),
        );

        final updatedTasks =
            currentState.tasks.map((task) {
              return task.taskId == event.oldTask.taskId ? updatedTask : task;
            }).toList();

        emit(TasksLoadedState(updatedTasks));
      }
    } catch (e, s) {
      logger.e(
        'Unexpected error during editing new task',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  Future<void> _onDeleteTask(
    DeleteTaskEvent event,
    Emitter<TasksState> emit,
  ) async {
    try {
      logger.i('Delete Task Event');
      await taskRepository.deleteTask(event.taskDelete.taskId);

      if (state is TasksLoadedState) {
        final currentTasks = (state as TasksLoadedState).tasks;

        final updatedTasks =
            currentTasks.where((task) => task != event.taskDelete).toList();
        _displayedTasks = updatedTasks;

        emit(TasksLoadedState(updatedTasks));
      } else {
        emit(TasksDeletingFailureState('No tasks available to delete.'));
      }
    } catch (e, s) {
      logger.e(
        'Unexpected error during deleting task from Firestore',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  Future<void> _onSearchTask(
    SearchTaskEvent event,
    Emitter<TasksState> emit,
  ) async {
    try {
      logger.i('Search Task Event');
      if (state is TasksLoadedState) {
        final query = event.query.toLowerCase().trim();

        if (query.isEmpty) {
          emit(TasksLoadedState(_displayedTasks));
        } else {
          final filteredTasks =
              _displayedTasks.where((task) {
                final taskTitle = task.taskTitle.toLowerCase();
                final words = taskTitle.split(' ');
                return words.any((word) => word.startsWith(query));
              }).toList();

          emit(TasksLoadedState(filteredTasks));
        }
      }
    } catch (e, s) {
      logger.e(
        'Unexpected error during searching task',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  Future<void> _onSortTasks(
    SortTasksEvent event,
    Emitter<TasksState> emit,
  ) async {
    try {
      logger.i('Sort Tasks Event');
      _currentSortingOption = event.sortingOption;
      _sortTasksByCurrentOption();

      if (state is TasksLoadedState) {
        emit(TasksLoadedState(_displayedTasks));
      }
    } catch (e, s) {
      logger.e('Unexpected error during sorting task', error: e, stackTrace: s);
      rethrow;
    }
  }
}
