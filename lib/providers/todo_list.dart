import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

const initTodoList = [
  ['todo-0', '右下のボタンからTODOの追加ができます。', false],
  ['todo-1', '長押しでTODOの移動ができます。', false],
  ['todo-2', '完了したTODOは右上のボタンからまとめて削除できます。', false],
];

class TodoList extends Notifier<List<dynamic>> {
  final _box = Hive.box('todoBox');

  @override
  List<dynamic> build() => initTodoList;

  void getInitTodo() async {
    if (_box.get('todoList') == null) {
      state = await initTodoList;
    } else {
      state = await _box.get('todoList');
    }
    saveToHive();
  }

  void saveToHive() {
    _box.put('todoList', state);
  }

  void add(String title) {
    state = [
      ...state,
      [_uuid.v4(), title, false],
    ];
    saveToHive();
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo[0] == id)
          [
            todo[0],
            todo[1],
            !todo[2],
          ]
        else
          todo,
    ];
    saveToHive();
  }

  void remove() {
    state = state.where((todo) => !todo[2]).toList();
    saveToHive();
  }

  void onReorder(int oldIndex, int newIndex) {
    var todoList = state.toList();
    if (oldIndex < newIndex) newIndex--;
    final List todo = todoList.removeAt(oldIndex);
    todoList.insert(newIndex, todo);
    state = todoList;
    saveToHive();
  }
}
