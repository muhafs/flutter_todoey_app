import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_app/models/task_data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.isChecked,
    required this.title,
    required this.callback,
    required this.atLongPress,
  });

  final bool isChecked;
  final String title;
  final Function(bool?) callback;
  final Function()? atLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: atLongPress,
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
