import 'package:flutter/material.dart';
import 'package:gallery_app/screens/show_photo_page.dart';
import 'package:photo_manager/photo_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHome(),
      routes: {
        '/showGallery': (context) => const ShowGallery(),
      },
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Gallery"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            PhotoManager.getAssetPathList();
            Navigator.pushNamed(context, '/showGallery');
          },
          child: const Text("Open Gallery"),
        ),
      ),
    );
  }
}
