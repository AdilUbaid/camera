import 'dart:io';
import 'package:image_picker/image_picker.dart';

Future PickImage<alav>() async {
  XFile? pickedimage;
  pickedimage = (await ImagePicker().pickImage(
    source: ImageSource.camera,
    maxWidth: 1800,
    maxHeight: 1800,
  ));

  File pick = File(pickedimage!.path);
  if (pick == null) {
    return;
  } else {
    print('not null');
    return pick;
  }
}
