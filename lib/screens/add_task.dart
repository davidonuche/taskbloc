import 'package:flutter/material.dart';
import 'package:taskbloc/models/tasks.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _dueDateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 5),
    );
    if (pickedDate != null) {
      setState(() {
        _dueDateController.text = pickedDate.toString();
      });
    }
  }

  String _selectedPriority = 'Low';

  void _addTask(BuildContext context) {
  // Show circular progress indicator
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: CircularProgressIndicator(),
    ),
  );

  // Simulate delay to demonstrate loading process
  Future.delayed(Duration(seconds: 2), () {
    // Add logic to actually add the task here
    // For demonstration, let's assume we're adding a task with title and description

    // Create a task object with the entered data
    String title = _titleController.text;
    String description = _descriptionController.text;
    Task newTask = Task(title: title, description: description, dueDate: DateTime.now(), priority: _selectedPriority);

    // Pop the circular progress indicator dialog
    Navigator.pop(context);

    // Pop the AddTask screen and pass the new task object as a result
    Navigator.pop(context, newTask);
  });
}


  // void _addTask(BuildContext context) {
  //   // Show circular progress indicator
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => Center(
  //       child: CircularProgressIndicator(),
  //     ),
  //   );

  //   // Simulate delay to demonstrate loading process
  //   Future.delayed(Duration(seconds: 2), () {
  //     // Add logic to actually add the task here
  //     // After adding the task, pop the dialog and navigate back to home screen
  //     Navigator.pop(context); // Pop the circular progress indicator dialog
  //     Navigator.pop(context); // Pop the AddTask screen
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  hintText: 'Enter task title',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Description',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _descriptionController,
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter task description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              const Text(
                'Due Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _dueDateController,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: 'Select due date',
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today),
                ),
                onTap: () {
                  _selectDate(context);
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Priority',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField(
                value: _selectedPriority,
                items: ['Low', 'Medium', 'High']
                    .map((priority) => DropdownMenuItem(
                          child: Text(priority),
                          value: priority,
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPriority = value.toString();
                  });
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  _addTask(context);
                },
                child: const Text('Add Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }
}
