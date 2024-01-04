import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list_app/pages/theme_setting_page.dart';
import 'package:todo_list_app/widgets/custom_list_tile.dart';
import 'package:todo_list_app/widgets/single_section.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

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
                      children: [
                        SingleSection(
                          title: "設定",
                          children: [
                            CustomListTile(
                              title: 'テーマカラー',
                              icon: CupertinoIcons.paintbrush,
                              url: '',
                              navigator: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ThemeSettingPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        const SingleSection(
                          title: "コンタクト",
                          children: [
                            CustomListTile(
                              title: "お問い合わせ",
                              icon: CupertinoIcons.envelope,
                              url: 'https://forms.gle/TTZCuFavsyzaWHaH6',
                            ),
                          ],
                        ),
                        const SingleSection(
                          title: "その他",
                          children: [
                            CustomListTile(
                              title: "利用規約",
                              icon: CupertinoIcons.text_justify,
                              url:
                                  'https://sites.google.com/view/simpletodo-terms-of-use/%E3%83%9B%E3%83%BC%E3%83%A0',
                            ),
                            CustomListTile(
                              title: "プライバシーポリシー",
                              icon: CupertinoIcons.lock,
                              url: 'https://forms.gle/TTZCuFavsyzaWHaH6',
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
