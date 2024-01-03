import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      children: const [
                        _SingleSection(
                          title: "設定",
                          children: [
                            _CustomListTile(
                              title: "テーマカラー",
                              icon: CupertinoIcons.paintbrush,
                              url: '',
                            ),
                          ],
                        ),
                        _SingleSection(
                          title: "コンタクト",
                          children: [
                            _CustomListTile(
                              title: "お問い合わせ",
                              icon: CupertinoIcons.envelope,
                              url: 'https://forms.gle/TTZCuFavsyzaWHaH6',
                            ),
                          ],
                        ),
                        _SingleSection(
                          title: "その他",
                          children: [
                            _CustomListTile(
                              title: "利用規約",
                              icon: CupertinoIcons.text_justify,
                              url:
                                  'https://sites.google.com/view/simpletodo-terms-of-use/%E3%83%9B%E3%83%BC%E3%83%A0',
                            ),
                            _CustomListTile(
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

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            // style: Theme.of(context)
            //     .textTheme
            //     .displaySmall
            //     ?.copyWith(fontSize: 16),
            style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary,
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
