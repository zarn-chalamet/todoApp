import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoBox extends StatelessWidget {
  final String toDoName;
  final bool finish;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
  ToDoBox(
      {super.key,
      required this.toDoName,
      required this.finish,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary,
          ),
          height: 100,
          child: Center(
            child: ListTile(
                leading: Checkbox(
                  onChanged: onChanged,
                  value: finish,
                  checkColor: Colors.black87,
                  activeColor: Colors.white54,
                ),
                title: Text(
                  toDoName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    decoration: finish
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
