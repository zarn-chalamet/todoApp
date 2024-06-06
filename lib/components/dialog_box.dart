import 'package:flutter/material.dart';
import 'package:todoapp/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onSaved,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.background,
      content: Container(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Add a new task'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Button(
                text: "Save",
                onPressed: onSaved,
              ),
              SizedBox(
                width: 5,
              ),
              Button(text: "Cancel", onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}
