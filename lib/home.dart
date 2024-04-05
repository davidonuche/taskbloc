import 'package:flutter/material.dart';
import 'package:taskbloc/models/tasks.dart';
import 'package:taskbloc/screens/add_task.dart';
import 'package:taskbloc/screens/task_details.dart';
import 'package:taskbloc/widgets/user_drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Task> _tasks = [
    Task(
      title: 'Task 1',
      description: 'Description 1',
      dueDate: DateTime(2024, 4, 10),
      priority: 'High', // Provide a default priority
    ),
    Task(
      title: 'Task 2',
      description: 'Description 2',
      dueDate: DateTime(2024, 4, 12), // Provide a default due date
      priority: 'Medium', // Provide a default priority
    ),
    Task(
      title: 'Task 3',
      description: 'Description 3',
      dueDate: DateTime(2024, 4, 15), // Provide a default due date
      priority: 'Low', // Provide a default priority
    ),
  ];
// List to store tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Dashboard')),
      ),
      drawer: const UserDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_tasks[index].title),
                  subtitle: const Text('Due Date: April 10, 2024'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TaskDetails(task: _tasks[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to AddTask screen and wait for result
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTask()),
          );

          // Check if result is not null (i.e., a new task was added)
          if (result != null) {
            // Update task list with the newly added task
            setState(() {
              _tasks.add(result);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
