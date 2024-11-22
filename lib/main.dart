import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:qrview/pages/load_page.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(LoadPage(
    cameras: cameras,
  ));
}
