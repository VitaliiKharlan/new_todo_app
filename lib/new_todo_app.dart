import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubits/theme_cubit/theme_cubit.dart';
import 'core/router/router.dart';
import 'core/theme/app_theme.dart';


class NewTodoApp extends StatefulWidget {
  const NewTodoApp({super.key});

  @override
  State<NewTodoApp> createState() => _NewTodoAppState();
}

class _NewTodoAppState extends State<NewTodoApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Todo App',
            theme: state.isLight ? lightTheme : darkTheme,
            routerConfig: _router.config(),
          );
        },
      ),
    );
  }
}

// class _MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Firebase App',
//       home: Scaffold(
//         appBar: AppBar(title: Center(child: Text('Firebase Initialized'))),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () async {
//               await addDataToFirestore();
//             },
//             child: Text('Добавить данные в Firestore'),
//           ),
//         ),
//       ),
//     );
//   }
// }