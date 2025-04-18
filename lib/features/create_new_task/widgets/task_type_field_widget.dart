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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Category', style: theme.textTheme.titleLarge),
        SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:
              TaskTypesEnum.values.take(5).map((TaskTypesEnum type) {
                return Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedTaskType == type
                              ? Colors.blue
                              : Colors.blue[100],
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    ).copyWith(
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _onTaskTypeSelected(type);
                    },
                    child: Text(
                      type.name,
                      style: TextStyle(
                        color:
                            _selectedTaskType == type
                                ? Colors.white
                                : Colors.black,
                        fontSize: 8,
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
