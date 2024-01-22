import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/pages/setting_page.dart';
import 'package:todo_list_app/providers/todo_list.dart';
import 'package:todo_list_app/widgets/add_todo_button.dart';
import 'package:todo_list_app/widgets/delete_todo_button.dart';
import 'package:todo_list_app/widgets/todo_list_view.dart';

final todoListProvider =
    NotifierProvider<TodoList, List<dynamic>>(TodoList.new);

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    ref.read(todoListProvider.notifier).getInitTodo();
  }

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: palette.background,
      appBar: AppBar(
        backgroundColor: palette.background,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: palette.onBackground,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingPage(),
              ),
            );
          },
        ),
        actions: [
          DeleteTodoButton(),
          const SizedBox(width: 15),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TodoListView(),
            ),
          ],
        ),
      ),
      floatingActionButton: AddTodoButton(),
    );
  }
}
