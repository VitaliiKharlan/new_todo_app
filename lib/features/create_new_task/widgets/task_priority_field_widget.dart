import 'package:flutter/material.dart';

import 'priority_dialog_widget.dart';

class TaskPriorityFieldWidget extends StatefulWidget {
  const TaskPriorityFieldWidget({
    super.key,
    required this.taskPriority,
    required this.onSelectedTaskPriority,
  });

  final int? taskPriority;
  final ValueChanged<int?> onSelectedTaskPriority;

  @override
  State<TaskPriorityFieldWidget> createState() =>
      _TaskPriorityFieldWidgetState();
}

class _TaskPriorityFieldWidgetState extends State<TaskPriorityFieldWidget> {
  int? _taskPriority;

  @override
  void didUpdateWidget(covariant TaskPriorityFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.taskPriority != oldWidget.taskPriority) {
      _taskPriority = widget.taskPriority;
    }
  }

  void _openPriorityDialog() async {
    final taskPriority = await showDialog<int?>(
      context: context,
      builder: (BuildContext context) {
        return PriorityDialogWidget(taskPriority: _taskPriority);
      },
    );

    if (taskPriority != null) {
      setState(() {
        _taskPriority = taskPriority;
      });

      widget.onSelectedTaskPriority(taskPriority);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Priority', style: theme.textTheme.titleLarge),
        SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: ElevatedButton.icon(
            onPressed: () {
              _openPriorityDialog();
            },
            icon: const Icon(Icons.priority_high),
            label: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 8),
                Text(
                  widget.taskPriority == null
                      ? 'Pick a priority'
                      : widget.taskPriority.toString(),
                  style:
                      widget.taskPriority == null
                          ? theme.textTheme.headlineMedium
                          : theme.textTheme.headlineLarge,
                ),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Color(0xFFFFFFFF)),
              foregroundColor: WidgetStateProperty.all(Color(0x40000000)),
              side: WidgetStateProperty.all(
                BorderSide(color: Color(0x40A9A9A9), width: 2),
              ),
              overlayColor: WidgetStateProperty.all<Color>(Color(0xFFFFFFFF)),
              shadowColor: WidgetStateProperty.all<Color>(Color(0xFFFFFFFF)),
              elevation: WidgetStateProperty.all<double>(0.1),
            ),
          ),
        ),
      ],
    );
  }
}
