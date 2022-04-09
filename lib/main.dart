import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'todo_home_page.dart';
import './models/todo.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TodoAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TODO",
      theme: ThemeData().copyWith(
          bottomSheetTheme:
              const BottomSheetThemeData(backgroundColor: Colors.transparent),
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
          cardColor: const Color.fromARGB(255, 25, 54, 140),
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: const Color(0xff031956),
                secondary: const Color(0xff344FA1),
              )),
      //   home: TodoHomePage(),
      // );
      home: FutureBuilder(
        future: Hive.openBox('todos'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const TodoHomePage();
            }
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }

  void dispose() {
    Hive.close();
  }
}
