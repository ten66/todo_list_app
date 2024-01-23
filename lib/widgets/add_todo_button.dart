import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_list_app/pages/home_page.dart';
import 'package:todo_list_app/widgets/cancel_button.dart';

class AddTodoButton extends ConsumerWidget {
  const AddTodoButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = TextEditingController();
    final palette = Theme.of(context).colorScheme;

    return FloatingActionButton(
      backgroundColor: palette.secondary,
      shape: const CircleBorder(),
      onPressed: () => showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('新規TODOの追加'),
          content: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CupertinoTextField(
              controller: controller,
              placeholder: 'タイトル',
              cursorColor: palette.secondary,
              maxLength: 100,
              style: TextStyle(
                color: palette.onSecondary,
              ),
            ),
          ),
          actions: [
            CancelButton(),
            TextButton(
              onPressed: () {
                if (controller.text != '') {
                  ref.read(todoListProvider.notifier).add(controller.text);
                  controller.clear();
                }
                Navigator.pop(context);
              },
              child: Text(
                '追加',
                style: TextStyle(
                  color: palette.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      tooltip: 'add todo',
      child: Icon(
        Icons.add,
        color: palette.onSecondary,
      ),
    );
  }
}
