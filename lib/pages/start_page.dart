//iniciar o app
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';
import 'package:qrview/controllers/propaganda_controller.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

// late CameraController controller;
Uint8List? imagem;

class StartPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const StartPage({super.key, required this.cameras});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  TextEditingController textQrController = TextEditingController();
  MobileScannerController qrController = MobileScannerController(
      returnImage: true, detectionSpeed: DetectionSpeed.noDuplicates);
  // bool isCapturnig = false; // Verifica se está capturando imagem
  bool _isFrontCamera = false; // Verifica se é câmera da frente ou traseira
  // int _selectCameraIndex = 0;
  bool _isFlashOn = false; // Flash está ligado?
  // Offset? _focusPoint; // Foco da câmera
  // double _currentZoom = 1.0; // Zom da câmera
  // File? _imagemCapturada;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    qrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('QR READER'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: double.infinity,
                    color: Colors.grey,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: InkWell(
                            onTap: () {
                              _toggleFlash();
                            },
                            child: _isFlashOn
                                ? const Icon(Icons.flash_on)
                                : const Icon(Icons.flash_off),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: InkWell(
                              // onTap: _toggleCamera,
                              child: Icon(Icons.cameraswitch_outlined)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10, left: 10),
                          child: Icon(Icons.qr_code_rounded),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.height / 4,
                      color: Colors.amber,
                      child: MobileScanner(
                        controller: qrController,
                        onDetect: (capture) {
                          print(capture.barcodes.first.rawValue.toString());
                          setState(() {
                            imagem = capture.image;

                            textQrController.text =
                                capture.barcodes.first.rawValue.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  // Center(
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width / 3,
                  //     height: MediaQuery.of(context).size.height / 4,
                  //     color: Colors.amber,
                  //     child: CameraPreview(controller),
                  //   ),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            imagem != null
                                ? Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.amber,
                                    child: Image(image: MemoryImage(imagem!)),
                                  )
                                : Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.amber,
                                  ),
                            Text('Ultimo')
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.amber,
                            ),
                            Text("container 2")
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              color: Colors.amber,
                            ),
                            Text("container 3")
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width - 80,
                        child: TextFormField(
                          controller: textQrController,
                          enabled: false,
                          autofocus: false,
                          readOnly: true,
                        ),
                      ),
                      SizedBox(
                          height: 100,
                          width: 40,
                          child: Icon(size: 40, Icons.copy_sharp)),
                    ],
                  )
                ],
              ),
            ),
            PropagandaController().bannerPropaganda(),
          ],
        ),
      ),
    );
  }

  void _toggleFlash() {
    setState(() {
      _isFlashOn = !_isFlashOn;
      qrController.toggleTorch();
    });
  }
}
//   void _toggleCamera() async {
//     int index = 0;
//     _isFrontCamera = !_isFrontCamera;
//     await controller.dispose();
//     if (_isFrontCamera) {
//       index = 1;
//     } else {
//       index = 0;
//     }
//     controller = CameraController(widget.cameras[index], ResolutionPreset.max);
//     await controller.initialize();
//     if (mounted) {
//       setState(() {});
//     }
//   }




//abrir camera

//ler a camera