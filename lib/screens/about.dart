import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  late final Future<String> _aboutContent = fetchAboutContent();

   Future<String> fetchAboutContent() async {
    final response = await http.get(Uri.parse('https://sites.google.com/view/taskbloc/home'));
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load about content');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('About')),
      ),
      body: FutureBuilder<String>(
        future: _aboutContent,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return SingleChildScrollView(
              child: Html(data: snapshot.data ?? ''),
            );
          }
        },
      ),
    );
  }
}
