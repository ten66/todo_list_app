import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String url;
  const CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.url,
  });

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
