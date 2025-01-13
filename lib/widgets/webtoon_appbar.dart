import 'package:flutter/material.dart';

class WebtoonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const WebtoonAppBar({
    super.key,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      foregroundColor: Colors.greenAccent,
      elevation: 2,
      title: title,
    );
  }
}
