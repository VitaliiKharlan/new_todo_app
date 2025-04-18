import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/enums/task_types_enum.dart';
import '../../location_search/data/models/location_details.dart';
import '../bloc/tasks_bloc.dart';
import '../data/models/task_dto.dart';
import '../widgets/task_deadline_field_widget.dart';
import '../widgets/task_description_field_widget.dart';
import '../widgets/task_location_field_widget.dart';
import '../widgets/task_name_field_widget.dart';
import '../widgets/task_priority_field_widget.dart';
import '../widgets/task_remind_time_field_widget.dart';
import '../widgets/task_type_field_widget.dart';

@RoutePage()
class CreateNewTaskScreen extends StatefulWidget {
  const CreateNewTaskScreen({super.key, this.editTask});

  final TaskDto? editTask;

  @override
  _CreateNewTaskScreenState createState() => _CreateNewTaskScreenState();
}

class _CreateNewTaskScreenState extends State<CreateNewTaskScreen> {
  late TextEditingController controllerTaskTitle;
  late TextEditingController _controllerTaskDescription;

  DateTime? _selectedDeadline;
  TaskTypesEnum? _selectedTaskType;
  int? _taskPriority;
  LocationDetailsModel? _taskLocation;
  List<DateTime>? _selectedRemindTime;

  @override
  void initState() {
    super.initState();

    controllerTaskTitle = TextEditingController(
      text: widget.editTask?.taskTitle ?? '',
    );
    _controllerTaskDescription = TextEditingController(
      text: widget.editTask?.taskDescription ?? '',
    );

    _selectedDeadline = widget.editTask?.taskDeadline;
    _selectedRemindTime = widget.editTask?.taskRemindTime;
    _selectedTaskType = widget.editTask?.taskType;
    _taskPriority = widget.editTask?.taskPriority;
    _taskLocation = widget.editTask?.taskLocation;
  }

  void _clearInputFields() {
    controllerTaskTitle.clear();
    _controllerTaskDescription.clear();

    setState(() {
      _selectedDeadline = null;
      _selectedRemindTime = null;
      _selectedTaskType = null;
      _taskPriority = null;
      _taskLocation = null;
    });
  }

  // passing a variable to a function
  void _addTodo(TasksBloc bloc) {
    final taskTitle = controllerTaskTitle.text.trim();
    final taskType = _selectedTaskType;
    final taskPriority = _taskPriority;
    final taskDeadline = _selectedDeadline;
    final taskDescription = _controllerTaskDescription.text.trim();
    final taskLocation = _taskLocation;
    final taskRemindTime = _selectedRemindTime;

    final tabsRouter = context.tabsRouter;

    if (taskTitle.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a task title')),
      );
      return;
    }

    if (widget.editTask == null) {
      // Create New Task
      bloc.add(
        AddTaskEvent(
          taskTitle,
          taskType,
          taskPriority,
          taskDeadline,
          taskDescription,
          taskLocation,
          taskRemindTime,
        ),
      );
    } else {
      // Edit Task
      bloc.add(
        EditTaskEvent(
          oldTask: widget.editTask!,
          taskTitle: controllerTaskTitle.text.trim(),
          taskType: _selectedTaskType,
          taskPriority: _taskPriority,
          taskDeadline: _selectedDeadline,
          taskDescription: _controllerTaskDescription.text.trim(),
          taskLocation: _taskLocation,
          taskRemindTime: _selectedRemindTime,
        ),
      );
    }

    _clearInputFields();

    tabsRouter.setActiveIndex(0);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDeadline ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDeadline) {
      setState(() {
        _selectedDeadline = picked.copyWith(
          hour: _selectedDeadline?.hour,
          minute: _selectedDeadline?.minute,
        );
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          _selectedDeadline != null
              ? TimeOfDay.fromDateTime(_selectedDeadline!)
              : TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDeadline = DateTime(
          _selectedDeadline!.year,
          _selectedDeadline!.month,
          _selectedDeadline!.day,
          picked.hour,
          picked.minute,
        );
      });
    } else if (picked != null && _selectedDeadline != null) {
      final DateTime now = DateTime.now();
      setState(() {
        _selectedDeadline = DateTime(
          now.year,
          now.month,
          now.day,
          picked.hour,
          picked.minute,
        );
      });
    }
  }

  void onLocationPicked(LocationDetailsModel? taskLocation) {
    setState(() {
      _taskLocation = taskLocation;
    });
  }

  Future<void> _selectRemindDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _selectedRemindTime?.isNotEmpty ?? false
              ? _selectedRemindTime!.first
              : DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      setState(() {
        _selectedRemindTime ??= [];
        _selectedRemindTime!.add(
          picked.copyWith(
            hour:
                _selectedRemindTime?.isNotEmpty == true
                    ? _selectedRemindTime!.last.hour
                    : DateTime.now().hour,
            minute:
                _selectedRemindTime?.isNotEmpty == true
                    ? _selectedRemindTime!.last.minute
                    : DateTime.now().minute,
          ),
        );
      });
    }
  }

  Future<void> _selectRemindTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime:
          _selectedRemindTime != null && _selectedRemindTime!.isNotEmpty
              ? TimeOfDay.fromDateTime(_selectedRemindTime!.last)
              : TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedRemindTime ??= [];
        if (_selectedRemindTime!.isNotEmpty) {
          _selectedRemindTime!.last = DateTime(
            _selectedRemindTime!.last.year,
            _selectedRemindTime!.last.month,
            _selectedRemindTime!.last.day,
            picked.hour,
            picked.minute,
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = BlocProvider.of<TasksBloc>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFFFF),
        iconTheme: IconThemeData(color: Color(0xFF000000)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 12),
            SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Color(0x149E9E9E),
                  child: Center(
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Color(0xFF9E9E9E),
                      ),
                      onPressed: () {
                        AutoTabsRouter.of(context).setActiveIndex(0);
                      },
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Text(
                    widget.editTask == null ? 'Create New Task' : 'Edit Task',
                    style: theme.appBarTheme.titleTextStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, top: 12, right: 20),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  TaskNameFieldWidget(controllerTaskTitle: controllerTaskTitle),
                  SizedBox(height: 20),
                  TaskTypeFieldWidget(
                    selectedTaskType: _selectedTaskType,
                    onTaskTypeSelected: (TaskTypesEnum type) {
                      setState(() {
                        _selectedTaskType = type;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TaskPriorityFieldWidget(
                    taskPriority: _taskPriority,
                    onSelectedTaskPriority: (newPriority) {
                      setState(() {
                        _taskPriority = newPriority;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  TaskDeadlineFieldWidget(
                    selectedDeadline: _selectedDeadline,
                    onSelectedDeadlineDate: () => _selectDate(context),
                    onSelectedDeadlineTime: () => _selectTime(context),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TaskDescriptionFieldWidget(
                    controllerTaskDescription: _controllerTaskDescription,
                  ),
                  SizedBox(height: 20),
                  TaskLocationFieldWidget(
                    taskLocation: _taskLocation,
                    onLocationPicked: onLocationPicked,
                  ),
                  SizedBox(height: 20),
                  TaskRemindDateTimeFieldWidget(
                    selectedRemindDateTime: _selectedRemindTime,
                    onSelectedRemindDate: () => _selectRemindDate(context),
                    onSelectedRemindTime: () => _selectRemindTime(context),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => _addTodo(bloc),
                      style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 18),
                        foregroundColor: Color(0xFFFFFFFF),
                        backgroundColor: Color(0xFF2196F3),
                      ).copyWith(
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      child: Text(
                        widget.editTask == null
                            ? 'Create Task'
                            : 'Save Changes',
                        style: theme.textTheme.headlineLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
