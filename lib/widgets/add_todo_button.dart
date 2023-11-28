import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTodoButton extends StatelessWidget {
  final dynamic controller;
  final VoidCallback onAdd;

  const AddTodoButton({
    super.key,
    required this.controller,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: const Color(0xFF94A684),
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
              cursorColor: const Color(0xFF94A684),
              maxLength: 100,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'キャンセル',
                style: TextStyle(
                  color: Color(0xFF94A684),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            TextButton(
              onPressed: onAdd,
              child: const Text(
                '追加',
                style: TextStyle(
                  color: Color(0xFF94A684),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      tooltip: 'add todo',
      child: const Icon(Icons.add),
    );
  }
}
