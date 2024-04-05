import 'package:flutter/material.dart';
import 'package:taskbloc/home.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Flincap extends StatefulWidget {
  const Flincap({Key? key}) : super(key: key);

  @override
  State<Flincap> createState() => _FlincapState();
}

class _FlincapState extends State<Flincap> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Flincap')),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://www.flincap.com/auth/login',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (_) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the Home screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class Flincap extends StatefulWidget {
//   const Flincap({Key? key}) : super(key: key);

//   @override
//   State<Flincap> createState() => _FlincapState();
// }

// class _FlincapState extends State<Flincap> {
//   bool _isLoading = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flincap'),
//         shape: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (c) => const Home(),
//                       ),
//                     );
//                   },

//       ),
//       body: Stack(
//         children: [
//           WebView(
//             initialUrl: 'https://www.flincap.com/',
//             javascriptMode: JavascriptMode.unrestricted,
//             onPageFinished: (_) {
//               setState(() {
//                 _isLoading = false;
//               });
//             },
//           ),
//           if (_isLoading)
//             const Center(
//               child: CircularProgressIndicator(),
//             ),
//         ],
//       ),
//     );
//   }
// }
