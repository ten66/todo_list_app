import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE4E4D0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFE4E4D0),
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
                        _SingleSection(
                          title: "コンタクト",
                          children: [
                            _CustomListTile(
                              title: "お問い合わせ",
                              icon: CupertinoIcons.envelope,
                              url: Uri.parse(
                                  'https://forms.gle/TTZCuFavsyzaWHaH6'),
                            ),
                          ],
                        ),
                        _SingleSection(
                          title: "その他",
                          children: [
                            _CustomListTile(
                              title: "利用規約",
                              icon: CupertinoIcons.text_justify,
                              url: Uri.parse(
                                  'https://sites.google.com/view/simpletodo-terms-of-use/%E3%83%9B%E3%83%BC%E3%83%A0'),
                            ),
                            _CustomListTile(
                              title: "プライバシーポリシー",
                              icon: CupertinoIcons.lock,
                              url: Uri.parse(
                                  'https://forms.gle/TTZCuFavsyzaWHaH6'),
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
  final Uri url;
  const _CustomListTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: const Icon(CupertinoIcons.forward, size: 18),
      onTap: () => launchUrl(url),
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
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFAEC3AE),
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
