import 'package:cameraapp/database/data_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<CameraData>> cameraNotifier = ValueNotifier([]);
Future<void> addImage(CameraData value) async {
  final cameraDB = await Hive.openBox<CameraData>('camera_db');
  cameraDB.add(value);
  cameraNotifier.value.add(value);
  cameraNotifier.notifyListeners();

  // studentDB.putAt(index, value);
}

Future<void> getAllStudents() async {
  final cameraDB = await Hive.openBox<CameraData>('camera_db');
  cameraNotifier.value.clear();
  cameraNotifier.value.addAll(cameraDB.values);
  cameraNotifier.notifyListeners();
}

Future<void> deleteStudent(String id) async {
  final cameraDB = await Hive.openBox<CameraData>('camera_db');
  final Map<dynamic, CameraData> deliveriesMap = cameraDB.toMap();
  dynamic desiredKey;
  deliveriesMap.forEach((key, value) {
    if (value.id == id) desiredKey = key;
  });
  cameraDB.delete(desiredKey);
  getAllStudents();
}
