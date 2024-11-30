// ignore_for_file: prefer_const_constructors
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
// import 'package:barcode/barcode.dart';

class CriarqrPage extends StatefulWidget {
  const CriarqrPage({super.key});

  @override
  State<CriarqrPage> createState() => _CriarqrPageState();
}

class _CriarqrPageState extends State<CriarqrPage> {
  @override
  void initState() {
    super.initState();
    // _generateBarcode(); // Gera o código ao inicializar
  }

  bool _showBarcode = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // _generateBarcode();
    return Scaffold(
      appBar: AppBar(title: const Text('Gerar Código de Barras')),
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 250,
              child: _showBarcode
                  ? Container(
                      width: 200,
                      height: 200,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: BarcodeWidget(
                            data: controller.text,
                            barcode: Barcode.qrCode(),
                            drawText: true,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      width: 200,
                      height: 200,
                      color: Colors.transparent,
                    ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 80,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextField(
                // keyboardType: controller,
                minLines: null,
                maxLines: null,
                autocorrect: false,
                controller: controller,
                expands: true,

                onSubmitted: (value) => setState(() {}),
                onChanged: (valor) {
                  controller.text = valor.trimRight();
                },
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showBarcode = true;
                    controller.text;
                  });
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (BuildContext context) => MostrarQrCriadoPage(
                  //             texto: controller.text,
                  //           )),
                  // );
                },
                child: Text('Gerar QR'),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            _showBarcode
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              print('compartilhar');
                            },
                            child: Icon(
                              Icons.share,
                              size: 50,
                            ),
                          ),
                          Text('Compartilhar')
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              print('Salvar');
                            },
                            child: Icon(
                              Icons.save_alt_sharp,
                              size: 50,
                            ),
                          ),
                          Text('Salvar')
                        ],
                      ),
                    ],
                  )
                : SizedBox(
                    height: 50,
                  )
          ],
        ),
      ),
    );
  }
}
