import 'package:flutter/material.dart';
import 'package:gallery_app/screens/show_select_photo.dart';
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
        '/showSelectPhoto': (context) => const SelectPhotoPage(),
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
        child: Column(
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () async {
                PhotoManager.getAssetPathList();
                final PermissionState _ps =
                    await PhotoManager.requestPermissionExtend();
                // if (_ps.isAuth) {
                Navigator.pushNamed(context, '/showSelectPhoto');
                // } else {
                //   print(_ps.isAuth);
                // }
              },
              child: const Text("Open Select Photo"),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
