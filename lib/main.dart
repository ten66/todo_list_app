import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: Color(0xFFAEC3AE),
          onPrimary: Color(0xFF303030),
          secondary: Color(0xFF94A684),
          onSecondary: Color(0xFF303030),
          error: Colors.red,
          onError: Colors.white,
          background: Color(0xFFE4E4D0),
          onBackground: Color(0xFF303030),
          surface: Color(0xFFFDE4ED),
          onSurface: Color(0xFF303030),
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
