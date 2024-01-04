import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/color_scheme.dart';
import 'package:todo_list_app/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  // ignore: unused_local_variable
  var box = await Hive.openBox('todoBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: greenColorScheme,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
