import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_list_app/pages/setting_page.dart';
import 'package:todo_list_app/widgets/add_todo_button.dart';
import 'package:todo_list_app/widgets/delete_todo_button.dart';
import 'package:todo_list_app/widgets/todo_list_view.dart';
import 'package:uuid/uuid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('todoBox');
  List todoList = [];

  var uuid = const Uuid();
  final _controller = TextEditingController();

  @override
  void initState() {
    if (_myBox.get('TODOLIST') == null) {
      todoList = [
        [uuid.v4(), '右下のボタンからToDoの追加ができます。', false],
        [uuid.v4(), '長押しでToDoの移動ができます。', false],
        [uuid.v4(), '完了したToDoは右上のボタンからまとめて削除できます。', false]
      ];
    } else {
      todoList = _myBox.get('TODOLIST');
    }

    super.initState();
  }

  void addTodo() {
    if (_controller.text != '') {
      setState(() {
        final todo = [uuid.v4(), _controller.text, false];
        todoList.add(todo);
        _controller.clear();
      });
      _saveToHive();
      Navigator.pop(context);
    }
  }

  void deleteTodo() {
    setState(() {
      todoList = todoList.where((todo) => !todo[2]).toList();
    });
    _saveToHive();
    Navigator.pop(context);
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][2] = value;
    });
    _saveToHive();
  }

  void onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex--;
    final List todo = todoList.removeAt(oldIndex);
    todoList.insert(newIndex, todo);
    _saveToHive();
  }

  void _saveToHive() {
    if (_myBox.get('TODOLIST') != null) {
      _myBox.delete('TODOLIST');
    }
    _myBox.put('TODOLIST', todoList);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          color: Theme.of(context).colorScheme.onBackground,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SettingPage(),
              ),
            );
          },
        ),
        actions: [
          DeleteTodoButton(onPressed: deleteTodo),
          const SizedBox(width: 15),
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: TodoListView(
                todoList: todoList,
                onChanged: checkBoxChanged,
                onReorder: onReorder,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: AddTodoButton(
        controller: _controller,
        onAdd: addTodo,
      ),
    );
  }
}
