import 'package:flutter/material.dart';

import '../../../core/enums/task_types_enum.dart';

class TaskTypeFieldWidget extends StatefulWidget {
  const TaskTypeFieldWidget({
    super.key,
    this.selectedTaskType,
    required this.onTaskTypeSelected,
  });

  final TaskTypesEnum? selectedTaskType;
  final ValueChanged<TaskTypesEnum> onTaskTypeSelected;

  @override
  State<TaskTypeFieldWidget> createState() => _TaskTypeFieldWidgetState();
}

class _TaskTypeFieldWidgetState extends State<TaskTypeFieldWidget> {
  TaskTypesEnum? _selectedTaskType;

  @override
  void didUpdateWidget(covariant TaskTypeFieldWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.selectedTaskType != oldWidget.selectedTaskType) {
      _selectedTaskType = widget.selectedTaskType;
    }
  }

  void _onTaskTypeSelected(TaskTypesEnum type) {
    setState(() {
      _selectedTaskType = type;
    });
    widget.onTaskTypeSelected(type);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final taskTypes = TaskTypesEnum.values.take(5).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: theme.textTheme.titleLarge),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < taskTypes.length; i++) ...[
              if (i != 0) SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _selectedTaskType == taskTypes[i]
                        ? const Color(0xFF2196F3)
                        : const Color(0xFFBBDEFB),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () => _onTaskTypeSelected(taskTypes[i]),
                  child: Text(
                    taskTypes[i].name,
                    style: TextStyle(
                      color: _selectedTaskType == taskTypes[i]
                          ? const Color(0xFFFFFFFF)
                          : const Color(0xFF000000),
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
