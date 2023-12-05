import 'package:flutter/material.dart';

class TableTitle extends StatelessWidget {
  final String title;
  const TableTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: Theme.of(context)
            .textTheme
            .titleLarge
            ?.copyWith(fontSize: 14, fontWeight: FontWeight.bold));
  }
}
