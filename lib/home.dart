import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, dynamic>> tasks = [];
  TextEditingController controller = TextEditingController();

  void addTask() {
    String text = controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        tasks.add({'text': text, 'done': false});
        controller.clear();
      });
    }
  }

  void toggleTask(int index) {
    setState(() {
      tasks[index]['done'] = !tasks[index]['done'];
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Task List
        Expanded(
          child: ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                elevation: 3,
                child: ListTile(
                  leading: Checkbox(
                    value: task['done'],
                    onChanged: (_) => toggleTask(index),
                  ),
                  title: Text(
                    task['text'],
                    style: TextStyle(
                      fontSize: 20,
                      decoration: task['done']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: task['done'] ? Colors.grey : Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteTask(index),
                  ),
                ),
              );
            },
          ),
        ),

        // Bottom Input
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Enter task',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ElevatedButton(
  onPressed: addTask,
  style: ElevatedButton.styleFrom(
    fixedSize: const Size(50, 50),
    shadowColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    backgroundColor: Colors.blue,
  ),
  child: const Icon(
    Icons.add,
    size: 30,
    color: Colors.white,
  ),
),

            ],
          ),
        ),
      ],
    );
  }
}
