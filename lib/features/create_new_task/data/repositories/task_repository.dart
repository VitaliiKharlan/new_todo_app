import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections_constant.dart';
import '../../../../core/services/logger_service.dart';
import '../../../../core/services/notification_service.dart';

abstract class ITaskRepository {
  Future<String> addTask(Map<String, dynamic> task);

  Future<List<Map<String, dynamic>>> fetchTasks();

  Future<void> updateTask(String id, Map<String, dynamic> task);

  Future<void> deleteTask(String id);
}

class TaskRepository extends ITaskRepository {
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<String> addTask(Map<String, dynamic> task) async {
    try {
      final taskId = task['taskId'];

      await _firestore
          .collection(FirestoreCollectionsConstant.tasks)
          .doc(taskId)
          .set(task);

      if (task['taskDeadline'] != null) {
        DateTime deadline = DateTime.parse(task['taskDeadline']);
        await NotificationService.scheduleNotification(
          taskId,
          task['taskTitle'],
          deadline,
        );
      }
      logger.i('Task added to Firestore with ID: $taskId');
      return taskId;
    } catch (e, s) {
      logger.e(
        'Unexpected error during adding task from Firestore',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> fetchTasks() async {
    try {
      final snapshot =
          await _firestore.collection(FirestoreCollectionsConstant.tasks).get();

      if (snapshot.docs.isEmpty) {
        return [];
      }

      logger.i('Fetched ${snapshot.docs.length} tasks from Firestore');
      return snapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id;
        return data;
      }).toList();
    } catch (e, s) {
      logger.e(
        'Unexpected error during getting task from Firestore',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  @override
  Future<void> updateTask(String id, Map<String, dynamic> task) async {
    try {
      if (task['taskDeadline'] != null) {
        DateTime deadline = DateTime.parse(task['taskDeadline']);

        await NotificationService.scheduleNotification(
          id,
          task['taskTitle'],
          deadline,
        );
      }

      final doc =
          await _firestore
              .collection(FirestoreCollectionsConstant.tasks)
              .doc(id)
              .get();

      if (!doc.exists) {
        return;
      }

      await _firestore
          .collection(FirestoreCollectionsConstant.tasks)
          .doc(id)
          .update(task);

      logger.i('Task updated from Firestore with ID: $id');
    } catch (e, s) {
      logger.e(
        'Unexpected error during updating task from Firestore',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      await _firestore
          .collection(FirestoreCollectionsConstant.tasks)
          .doc(id)
          .delete();

      logger.i('Task deleted from Firestore with ID: $id');
    } catch (e, s) {
      logger.e(
        'Unexpected error during deleting task from Firestore',
        error: e,
        stackTrace: s,
      );
      rethrow;
    }
  }
}
