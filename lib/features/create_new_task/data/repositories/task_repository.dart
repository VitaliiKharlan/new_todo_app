import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/constants/firestore_collections_constant.dart';
import '../../../../core/services/notification_service.dart';
// import '../task_database.dart';

class TaskRepository {
  // final TaskDatabase _taskDatabase = TaskDatabase();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addTask(Map<String, dynamic> task) async {
    // final String taskId = await _taskDatabase.insertTask(task);
    final String taskId =
        _firestore.collection(FirestoreCollectionsConstant.tasks).doc().id;
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

    return taskId;
  }

  // Future<List<Map<String, dynamic>>> fetchTasks() async {
  //   final records = await _taskDatabase.getAllTasks();
  //   return records.map((snapshot) {
  //     final task = snapshot.value;
  //
  //     return task;
  //   }).toList();
  // }

  Future<List<Map<String, dynamic>>> fetchTasks() async {
    final snapshot =
        await _firestore.collection(FirestoreCollectionsConstant.tasks).get();

    if (snapshot.docs.isEmpty) {
      return [];
    }

    return snapshot.docs.map((doc) {
      return doc.data();
    }).toList();
  }

  Future<void> updateTask(String id, Map<String, dynamic> task) async {
    if (task['taskDeadline'] != null) {
      DateTime deadline = DateTime.parse(task['taskDeadline']);

      await NotificationService.scheduleNotification(
        id,
        task['taskTitle'],
        deadline,
      );
    }

    // _taskDatabase.updateTask(id, task);
    await _firestore
        .collection(FirestoreCollectionsConstant.tasks)
        .doc(id)
        .update(task);
  }

  Future<void> deleteTask(String id) async {


    try {
      final docSnapshot = await _firestore
          .collection(FirestoreCollectionsConstant.tasks)
          .doc(id)
          .get();

      if (docSnapshot.exists) {
        await _firestore
            .collection(FirestoreCollectionsConstant.tasks)
            .doc(id)
            .delete();
        print("Task with id: $id deleted successfully");
      } else {
        print("No task found with id: $id");
      }
    } catch (e) {
      print("Error deleting task: $e");
      rethrow;
    }
  }
}
