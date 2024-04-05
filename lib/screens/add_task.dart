// AddTask.dart

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTask extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  final String _selectedPriority =
      'Low'; // For simplicity, assume the priority is always low

  void _addTask(BuildContext context) async {
    // Construct task object from user input
    var taskData = {
      'title': _titleController.text,
      'description': _descriptionController.text,
      'dueDate': _dueDateController.text,
      'priority': _selectedPriority,
    };

    // Send task data to backend
    var response = await http.post(
      Uri.parse('your-backend-api-url/addTask'),
      body: taskData,
    );

    if (response.statusCode == 200) {
      // Task added successfully, navigate back to Home screen
      Navigator.pop(context, true); // Pass true to indicate task was added
    } else {
      // Handle error
      print('Failed to add task: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Failed to add task. Please try again later.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Task'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text fields for task details (title, description, due date)
              // Dropdown for priority
              // Add Task button
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _addTask(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
































// import 'package:flutter/material.dart';

// class AddTask extends StatefulWidget {
//   const AddTask({Key? key}) : super(key: key);

//   @override
//   _AddTaskState createState() => _AddTaskState();
// }

// class _AddTaskState extends State<AddTask> {
//   TextEditingController _titleController = TextEditingController();
//   TextEditingController _descriptionController = TextEditingController();
//   TextEditingController _dueDateController = TextEditingController();

//   String _selectedPriority = 'Low';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Task'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Title',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _titleController,
//               decoration: const InputDecoration(
//                 hintText: 'Enter task title',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Description',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _descriptionController,
//               maxLines: 3,
//               decoration: const InputDecoration(
//                 hintText: 'Enter task description',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             SizedBox(height: 16),
//             const Text(
//               'Due Date',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _dueDateController,
//               decoration: const InputDecoration(
//                 hintText: 'Select due date',
//                 border: OutlineInputBorder(),
//                 suffixIcon: Icon(Icons.calendar_today),
//               ),
//               onTap: () {
//                 // Implement date picker here
//               },
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Priority',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 8),
//             DropdownButtonFormField(
//               value: _selectedPriority,
//               items: ['Low', 'Medium', 'High']
//                   .map((priority) => DropdownMenuItem(
//                         child: Text(priority),
//                         value: priority,
//                       ))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() {
//                   _selectedPriority = value.toString();
//                 });
//               },
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 24),
//             ElevatedButton(
//               onPressed: () {
//                 // Implement logic to add task
//               },
//               child: const Text('Add Task'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _titleController.dispose();
//     _descriptionController.dispose();
//     _dueDateController.dispose();
//     super.dispose();
//   }
// }
