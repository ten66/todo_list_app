import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todo_list_app/pages/home_page.dart';
import 'package:todo_list_app/widgets/cancel_button.dart';

class DeleteTodoButton extends ConsumerWidget {
  const DeleteTodoButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final palette = Theme.of(context).colorScheme;

    return IconButton(
      icon: const FaIcon(FontAwesomeIcons.trashCan),
      color: palette.onBackground,
      onPressed: () => showCupertinoDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: const Text('TODOの削除'),
          content: const Text('完了したTODOを全て削除しますか？'),
          actions: [
            CancelButton(),
            TextButton(
              onPressed: () {
                ref.read(todoListProvider.notifier).remove();
                Navigator.pop(context);
              },
              child: Text(
                '削除',
                style: TextStyle(
                  color: palette.secondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
