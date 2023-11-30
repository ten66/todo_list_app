import 'package:flutter/material.dart';

class TodoListView extends StatelessWidget {
  final List todoList;
  final void Function(bool?, int) onChanged;
  final void Function(int, int) onReorder;

  const TodoListView({
    super.key,
    required this.todoList,
    required this.onChanged,
    required this.onReorder,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: todoList.isEmpty,
      replacement: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ReorderableListView.builder(
          padding: const EdgeInsets.only(top: 20, bottom: 40),
          proxyDecorator: (child, index, animation) => Material(
            type: MaterialType.transparency,
            child: child,
          ),
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: todoList.length,
          itemBuilder: (context, index) => Card(
            key: ValueKey(todoList[index]),
            color: Theme.of(context).colorScheme.primary,
            child: ListTile(
              leading: Checkbox(
                value: todoList[index][2],
                onChanged: (value) => onChanged(value, index),
                activeColor: Theme.of(context).colorScheme.surface,
                checkColor: Theme.of(context).colorScheme.secondary,
              ),
              title: Text(
                todoList[index][1],
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 18,
                  decoration: todoList[index][2]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 2,
                  decorationColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ),
          onReorder: onReorder,
        ),
      ),
      child: const Center(
        child: Text('TODOがありません'),
      ),
    );
  }
}
