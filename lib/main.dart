import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'firebase_options.dart';
import 'new_todo_app.dart';


Future<void> addDataToFirestore() async {
  try {
    // Пытаемся добавить данные в Firestore
    await FirebaseFirestore.instance.collection('users').add({
      'name': 'John Doe4',
      'email': 'johndoe@example.com',
    });
    print('Data added to Firestore');
  } catch (e) {
    print('Error adding data to Firestore: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  tz.initializeTimeZones();
  await initNotifications();

  await _showNotification();

  runApp(const NewTodoApp());
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: DarwinInitializationSettings(),
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> _showNotification() async {
  const androidDetails = AndroidNotificationDetails(
    'task_channel',
    'Task Notifications',
    channelDescription: 'Task reminders',
    importance: Importance.high,
    priority: Priority.high,
  );

  const platformDetails = NotificationDetails(android: androidDetails);

  debugPrint('Scheduling notification');

  await flutterLocalNotificationsPlugin.show(
    0, // unique identifier
    'Hello!',
    'This notification appeared when the application todo_app was launched.',
    platformDetails,
  );
}


