import 'package:flutter/material.dart';

class SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const SingleSection({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final palette = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: palette.onPrimary,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: palette.primary,
          ),
          width: double.infinity,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
