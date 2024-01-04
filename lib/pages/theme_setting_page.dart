import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/widgets/custom_list_tile.dart';
import 'package:todo_list_app/widgets/single_section.dart';
import 'package:url_launcher/url_launcher.dart';

class ThemeSettingPage extends StatelessWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 400),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: const [
                        SingleSection(
                          title: 'テーマカラー',
                          children: [
                            CustomListTile(
                              title: 'ライト',
                              icon: CupertinoIcons.paintbrush,
                              url: '',
                            ),
                            CustomListTile(
                              title: 'ダーク',
                              icon: CupertinoIcons.paintbrush,
                              url: '',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String url;
  const _CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      trailing: Icon(
        CupertinoIcons.forward,
        size: 18,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      onTap: url != '' ? () => launchUrl(Uri.parse(url)) : () {},
    );
  }
}

// class _SingleSection extends StatelessWidget {
//   final String title;
//   final List<Widget> children;
//   const _SingleSection({
//     Key? key,
//     required this.title,
//     required this.children,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const SizedBox(height: 16),
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             title,
//             style: TextStyle(
//               fontSize: 16,
//               color: Theme.of(context).colorScheme.onPrimary,
//             ),
//           ),
//         ),
//         Container(
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             color: Theme.of(context).colorScheme.primary,
//           ),
//           width: double.infinity,
//           child: Column(
//             children: children,
//           ),
//         ),
//       ],
//     );
//   }
// }
