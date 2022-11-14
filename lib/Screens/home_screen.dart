// import 'dart:html';
import 'dart:io'; 
import 'package:cameraapp/database/data_model.dart';
import 'package:cameraapp/functions/db_function.dart';
import 'package:cameraapp/main.dart';
import 'package:cameraapp/widgets/camera_click.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class homeScreen extends StatelessWidget {
  homeScreen({
    Key? key,
    required this.imagepath,
  }) : super(key: key);

  final String imagepath;

  int flag = 0;

  @override
  Widget build(BuildContext context) {
    Permission.storage.request();
    getAllStudents();

    return Scaffold(
      appBar: AppBar(
        title: Text('Camera'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
          valueListenable: cameraNotifier,
          builder:
              (BuildContext ctx, List<CameraData> studentList, Widget? child) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // crossAxisSpacing: 2.0,
                  childAspectRatio: 1),
              // (Orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                final data = studentList[index];
                return GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Image.file(
                        File('storage/emulated/0/Imagecamera/${data.id}.jpg')),
                  ),

                  
                  onTap: () {
                   //to open
                  },
                );
              },
              itemCount: studentList.length,
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await cam();
        },
        child: const Icon(
          Icons.camera_alt_outlined,
          size: 30,
        ),
      ),
    );
  }

  Future cam() async {
    await CameraClick(myImagePath);
  
  }
}
