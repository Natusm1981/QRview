import 'dart:typed_data';
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:qrview/controllers/propaganda_controller.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:qrview/pages/mostrar_qr_page.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';

// late CameraController controller;
Uint8List? imagem;

class StartPage extends StatefulWidget {
  final List<CameraDescription> cameras;
  const StartPage({super.key, required this.cameras});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  MobileScannerController mobileScannerController = MobileScannerController(
    autoStart: true,
    returnImage: true,
    detectionSpeed: DetectionSpeed.noDuplicates,
  );
  bool _isNavigating = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mobileScannerController.start();
  }

  @override
  void dispose() {
    mobileScannerController.stop();
    mobileScannerController.dispose();
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
              child: AiBarcodeScanner(
                setPortraitOrientation: false,
                borderColor: Colors.yellow,
                borderWidth: 2,
                hideSheetTitle: true,
                hideSheetDragHandler: true,
                scanWindowUpdateThreshold: 0.5,
                fit: BoxFit.fill,
                controller: mobileScannerController,
                onDetect: (BarcodeCapture barcodeCapture) async {
                  if (_isNavigating) return;
                  _isNavigating = true;
                  final Uint8List? image = barcodeCapture.image;
                  if (mounted && image != null) {
                    mobileScannerController.stop();

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MostrarQrPage(
                          imagem: image,
                          texto:
                              barcodeCapture.barcodes.first.rawValue.toString(),
                          mobileScannerController: mobileScannerController,
                        ),
                      ),
                    );

                    mobileScannerController.start();
                  }
                  _isNavigating = false;
                },
              ),
            ),
            PropagandaController().bannerPropaganda(),
          ],
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return SafeArea(
  //     child: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('QR READER'),
  //       ),
  //       body: Column(
  //         mainAxisAlignment: MainAxisAlignment.end,
  //         children: [
  //           Expanded(
  //             child: AiBarcodeScanner(
  //               setPortraitOrientation: false,
  //               //  galleryButtonAlignment: ,
  //               borderColor: Colors.yellow,
  //               borderWidth: 2,

  //               hideSheetTitle: true,
  //               hideSheetDragHandler: true,
  //               scanWindowUpdateThreshold: 0.5,
  //               fit: BoxFit.fill,
  //               controller: mobileScannerController,
  //               onDetect: (BarcodeCapture barcodeCapture) {
  //                 final Uint8List? image = barcodeCapture.image;
  //                 final texto =
  //                     barcodeCapture.barcodes.first.rawValue.toString();
  //                 mobileScannerController.stop();
  //                 if (mounted && image != null) {
  //                   Navigator.push(
  //                     context,
  //                     MaterialPageRoute(
  //                       builder: (BuildContext context) => MostrarQrPage(
  //                         imagem: image,
  //                         texto: texto,
  //                       ),
  //                     ),
  //                   );
  //                 }

  //                 debugPrint(barcodeCapture.barcodes.first.rawValue.toString());
  //               },
  //             ),
  //           ),
  //           PropagandaController().bannerPropaganda(),
  //         ],
  //       ),
  //     ),
  //   );
}

  // Container ultimos3QR() {
  //   return Container(
  //     height: 100,
  //     width: double.infinity,
  //     color: Colors.blue,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             imagem != null
  //                 ? Container(
  //                     width: 50,
  //                     height: 50,
  //                     color: Colors.amber,
  //                     child: Image(image: MemoryImage(imagem!)),
  //                   )
  //                 : Container(
  //                     width: 50,
  //                     height: 50,
  //                     color: Colors.amber,
  //                   ),
  //             const Text('Ultimo')
  //           ],
  //         ),
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //               width: 50,
  //               height: 50,
  //               color: Colors.amber,
  //             ),
  //             const Text("container 2")
  //           ],
  //         ),
  //         Column(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             Container(
  //               width: 50,
  //               height: 50,
  //               color: Colors.amber,
  //             ),
  //             const Text("container 3")
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }

