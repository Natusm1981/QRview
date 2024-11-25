import 'dart:math';
import 'dart:typed_data';
import 'package:image/image.dart' as img;
import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:qrview/animacoes/caixaAnimada.dart';
import 'package:qrview/controllers/propaganda_controller.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:qrview/pages/mostrar_qr_page.dart';

Uint8List?
    imagem; //<<<<<<falta agora implementar um shared preferences com os 3 últimos qr lidos e mostrar na página de resultados

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
        drawer: Drawer(
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.qr_code),
                title: Text('Criar QR'),
                onTap: () {},
              ),
              ListTile(
                  leading: Icon(Icons.list_rounded),
                  title: Text('Últimas leituras')),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('QR READER'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: AiBarcodeScanner(
                customOverlayBuilder: (context, test, mobileScannerController) {
                  return CaixaAnimada();
                },
                actions: [],
                bottomSheetBuilder: (context, controller) {},
                sheetTitle: 'Leitura de Qualquer QR',
                setPortraitOrientation: false,
                borderColor: Colors.yellow,
                borderWidth: 2,
                hideSheetTitle: false,
                hideSheetDragHandler: true,
                scanWindowUpdateThreshold: 0.5,
                fit: BoxFit.fill,
                controller: mobileScannerController,
                onDetect: (BarcodeCapture barcodeCapture) async {
                  final limites = barcodeCapture.barcodes.first.corners;
                  final img.Image? imagemManipulavel =
                      img.decodeImage(barcodeCapture.image!);

                  final Offset x1 = limites[0];
                  final Offset x2 = limites[1];
                  final Offset x3 = limites[2];
                  final Offset x4 = limites[3];

                  final valor = 3;

                  final inicioX = min(x1.dx, x4.dx).toInt() - valor;
                  final inicioY = min(x1.dy, x2.dy).toInt() - valor;
                  final largura = valor * 2 +
                      max(x2.dx, x3.dx).toInt() -
                      min(x1.dx, x4.dx).toInt();
                  final altura = valor * 2 +
                      max(x4.dy, x3.dy).toInt() -
                      min(x1.dy, x2.dy).toInt();

                  final img.Image cropped = img.copyCrop(imagemManipulavel!,
                      x: inicioX, y: inicioY, width: largura, height: altura);

                  final imagemPassar =
                      Uint8List.fromList(img.encodeJpg(cropped));
                  if (_isNavigating) return;
                  _isNavigating = true;
                  if (mounted) {
                    mobileScannerController.stop();

                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => MostrarQrPage(
                          imagem: imagemPassar,
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
}
