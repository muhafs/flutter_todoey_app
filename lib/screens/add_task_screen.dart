// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen(this.callBackTitle, {super.key});

  final Function callBackTitle;

  @override
  Widget build(BuildContext context) {
    String? inputVal;

    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 30, 40, 0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              textAlign: TextAlign.center,
              'Add Task',
              style: TextStyle(
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              cursorColor: Colors.red,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.red.shade300, width: 2.0),
                ),
                hintText: 'Drink a cup of coffee',
              ),
              onChanged: (value) {
                inputVal = value;
              },
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                callBackTitle(inputVal);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'Button label',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
