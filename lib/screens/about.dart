import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://sites.google.com/view/taskbloc/home',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
           const  Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}