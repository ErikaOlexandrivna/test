import 'package:flutter/material.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todoList = [];
  final List<String> _completedTasks = [];
  final TextEditingController _textFiledController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List '),
      ),
      body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (BuildContext context, int index) {
            final bool completed = _completedTasks.contains(_todoList[index]);
            return ListTile(
              title: Text(_todoList[index]),
              trailing: Checkbox(
                onChanged: (bool? value) {
                  _toggleComletion(_todoList[index]);
                },
                value: completed,
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _displayDialog(context),
        child: const Icon(Icons.add_circle),
      ),
    );
  }

  Future<AlertDialog?> _displayDialog(BuildContext context) async {
    return showDialog<AlertDialog>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Додай завдання в список', style: Theme.of(context).textTheme.bodyLarge),
            content: Column(
              children: [
                const Icon(Icons.ac_unit),
                TextField(
                  controller: _textFiledController,
                  decoration: const InputDecoration(
                    prefixIconColor: Colors.pink,
                    prefixIcon: Icon(Icons.ac_unit_outlined),
                  ),
                )
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Закрити'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _addTodo(_textFiledController.text);
                    },
                    child: const Text('Додати'),
                  )
                ],
              )
            ],
          );
        });
  }

  void _addTodo(String text) {
    if (text != '') {
      setState(() {
        _todoList.add(text);
        _textFiledController.clear();
        Navigator.of(context).pop();
      });
    }
  }

  void _toggleComletion(String todoItem) {
    setState(() {
      if (_completedTasks.contains(todoItem)) {
        _completedTasks.remove(todoItem);
      } else {
        _completedTasks.add(todoItem);
      }
    });
  }
}
