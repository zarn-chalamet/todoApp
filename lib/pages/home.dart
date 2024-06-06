import 'package:flutter/material.dart';
import 'package:todoapp/components/change_mode.dart';
import 'package:todoapp/components/dialog_box.dart';
import 'package:todoapp/components/tile.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  List toDoList = [
    ['do homework', true],
    ['do laundry', false],
    ['do exercise', false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSaved: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text('TO DO'),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        drawer: Drawer(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          child: Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.calendar_month_outlined,
                color: Colors.black45,
                size: 50,
              )),
              ListTile(
                leading: Text(
                  "Mode",
                  style: TextStyle(fontSize: 15),
                ),
                title: changeMode(),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: createNewTask, child: Icon(Icons.add)),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoBox(
              toDoName: toDoList[index][0],
              finish: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
