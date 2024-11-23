import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrview/controllers/propaganda_controller.dart';

class MostrarQrPage extends StatefulWidget {
  const MostrarQrPage(
      {super.key,
      required this.texto,
      required this.imagem,
      required this.mobileScannerController});
  final String texto;
  final Uint8List imagem;
  final MobileScannerController mobileScannerController;

  @override
  State<MostrarQrPage> createState() => _MostrarQrPageState();
}

class _MostrarQrPageState extends State<MostrarQrPage> {
  TextEditingController textQrController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textQrController.text = widget.texto;
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 250,
                  child: widget.imagem.isNotEmpty
                      ? Image.memory(widget.imagem)
                      : const Text('Nenhuma imagem capturada'),
                ),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width - 80,
                  child: TextFormField(
                    controller: textQrController,
                    textAlign: TextAlign.center,
                    enabled: false,
                    autofocus: false,
                    readOnly: true,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: textQrController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(milliseconds: 1500),
                          content: Center(
                              child: Text('Texto copiado para a memória!')),
                        ),
                      );
                    },
                    child: Text('Copiar para a memória'))
              ],
            ),
          ),
          PropagandaController().bannerPropaganda(),
        ],
      ),
    );
  }
}
