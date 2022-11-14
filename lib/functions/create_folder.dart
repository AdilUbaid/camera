import 'dart:io';

import 'package:permission_handler/permission_handler.dart';

Future<String>  createFolder() async {
  const folderName = 'Imagecamera';
  final path = Directory("storage/emulated/0/$folderName");
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    print('granded');
    await Permission.storage.request();
  }
  if ((await path.exists())) {
    return path.path;
  } else {
    path.create();
    return path.path;
  }
}
