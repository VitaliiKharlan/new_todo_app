import 'package:flutter/material.dart';

import 'package:auto_route/auto_route.dart';

import '../../create_new_task/data/models/task_dto.dart';
import '../widgets/main_information_widget.dart';
import '../widgets/overview_widget.dart';
import '../widgets/project_milestone_widget.dart';

@RoutePage()
class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({
    super.key,
    required this.task,
    required this.onDelete,
  });

  final TaskDto task;
  final void Function(TaskDto) onDelete;

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
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
                  color: Colors.grey.withAlpha(20),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_new, color: Colors.grey),
                      onPressed: () {
                        AutoRouter.of(context).maybePop();
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
                    'Task Details',
                    style: theme.appBarTheme.titleTextStyle,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                widget.onDelete(widget.task);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MainInformation(task: widget.task),
              SizedBox(height: 20),
              ProjectMilestoneWidget(task: widget.task),
              SizedBox(height: 20),
              OverviewWidget(task: widget.task),
              SizedBox(height: 20),
              // WeatherWidget(task: widget.task),
              // SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
