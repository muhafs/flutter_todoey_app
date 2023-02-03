import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.title,
    required this.callback,
  });

  final bool isChecked;
  final String title;
  final Function(bool?) callback;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          decorationColor: Colors.red,
          decorationThickness: 2.5,
          decoration: isChecked == true
              ? TextDecoration.lineThrough
              : TextDecoration.none,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.red,
        value: isChecked,
        onChanged: callback,
      ),
    );
  }
}
