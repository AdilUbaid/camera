// import 'dart:io';

import 'package:cameraapp/Screens/home_screen.dart';
import 'package:cameraapp/database/data_model.dart';
import 'package:cameraapp/functions/create_folder.dart';
import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';

String myImagePath = '';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  myImagePath = await createFolder();

  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CameraDataAdapter().typeId)) {
    Hive.registerAdapter(CameraDataAdapter());
  }
  runApp(Main(
    ImagePath: myImagePath,
  ));
}

class Main extends StatelessWidget {
  const Main({super.key, required this.ImagePath});
  final String ImagePath;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: homeScreen(imagepath: ImagePath),
    );
  }
}
