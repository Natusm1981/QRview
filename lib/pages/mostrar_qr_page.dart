import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrview/controllers/propaganda_controller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

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
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4 * 3,
                  child: ElevatedButton(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Copiar para memória'), Icon(Icons.copy)],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4 * 3,
                  child: ElevatedButton(
                    onPressed: () {
                      _compartilhar_dado(textQrController.text);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Compartilhar'), Icon(Icons.share)],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 4 * 3,
                  child: ElevatedButton(
                    onPressed: () {
                      _pesquisarNaWeb(textQrController.text);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Pesquisar na web'), Icon(Icons.search)],
                    ),
                  ),
                ),
              ],
            ),
          ),
          PropagandaController().bannerPropaganda(),
        ],
      ),
    );
  }

  Future<void> _compartilhar_dado(String dado) async {
    try {
      await Share.share(dado);
    } catch (e) {
      debugPrint('Eerro ao COMPARTILHJAR Dado: $e');
    }
  }

  Future<void> _pesquisarNaWeb(String texto) async {
    final Uri url = Uri.parse('https://www.google.com/search?q=$texto');
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Não foi possível abrir o browser para pesquisar $texto');
    }
  }
}
