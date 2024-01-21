import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

const initTodoList = [
  ['todo-0', '右下のボタンからTODOの追加ができます。', false],
  ['todo-1', '長押しでTODOの移動ができます。', false],
  ['todo-2', '完了したTODOは右上のボタンからまとめて削除できます。', false],
];

class TodoList extends Notifier<List<List>> {
  late Box _box;

  @override
  List<List> build() => initTodoList;

  // initState()でのみ実行の関数
  void getInitTodo() {
    state = initTodoList;
    saveToHive();
  }

  // Hiveに保存する関数
  // わざわざ毎回deleteする必要があるのか？
  void saveToHive() {
    _box = Hive.box('todoBox');
    if (_box.get('TODOLIST') != null) {
      _box.delete('TODOLIST');
    } else {
      _box.put('TODOLIST', state);
    }
  }

  void add(String title) {
    state = [
      ...state,
      [_uuid.v4(), title, false],
    ];
    saveToHive();
  }

  void toggle(bool value, int index) {
    // state = [
    //   for(final todo in state)
    //     if (todo[0] == )
    // ]
    // これでいいのか？
    state[index][2] = value;
    saveToHive();
  }

  void remove() {
    // これでいいのか？
    state = state.where((todo) => !todo[2]).toList();
    saveToHive();
  }

  void onReorder(int oldIndex, int newIndex) {
    var todoList = state;
    if (oldIndex < newIndex) newIndex--;
    final List todo = todoList.removeAt(oldIndex);
    todoList.insert(newIndex, todo);
    state = todoList;
    saveToHive();
  }
}
