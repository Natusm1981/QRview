import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:qrview/configuracoes/color_theme.dart';
import 'package:qrview/pages/start_page.dart';

class LoadPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const LoadPage({super.key, required this.cameras});

  @override
  State<LoadPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoadPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StartPage(
        cameras: widget.cameras,
      ),
      theme: buildDarkTheme(),
    );
  }
}
