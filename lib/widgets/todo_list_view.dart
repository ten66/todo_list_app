import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/pages/home_page.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListProvider);
    final palette = Theme.of(context).colorScheme;

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
            color: palette.primary,
            child: ListTile(
              leading: Checkbox(
                value: todoList[index][2],
                onChanged: (value) => ref
                    .read(todoListProvider.notifier)
                    .toggle(todoList[index][0]),
                activeColor: palette.surface,
                checkColor: palette.secondary,
              ),
              title: Text(
                todoList[index][1],
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                  color: palette.onPrimary,
                  fontSize: 16,
                  decoration: todoList[index][2]
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  decorationThickness: 2,
                  decorationColor: palette.onPrimary,
                ),
              ),
            ),
          ),
          onReorder: (oldIndex, newIndex) =>
              ref.read(todoListProvider.notifier).onReorder(oldIndex, newIndex),
        ),
      ),
      child: const Center(
        child: Text('TODOがありません'),
      ),
    );
  }
}
