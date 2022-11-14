import 'dart:io';

import 'package:cameraapp/database/data_model.dart';
import 'package:cameraapp/functions/db_function.dart';
import 'package:cameraapp/main.dart';
import 'package:cameraapp/widgets/camera_control.dart';

// ignore: non_constant_identifier_names
Future CameraClick(String ImagePath) async {
  final path = await PickImage();
  final File newImage = path;
  final id = DateTime.now().toString();
  newImage.copy('$myImagePath/$id.jpg');
  final cam = CameraData(id: id);
  print('copy success');
  addImage(cam);

  // final _camera = CameraData(id: id, path: path);
  // addImage(_camera);
}
