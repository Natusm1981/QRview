// import 'package:flutter/material.dart';

// final String listaQr = 'lista_de_qr';

// class Ultimos3qr extends StatefulWidget {
//   const Ultimos3qr({super.key});

//   @override
//   State<Ultimos3qr> createState() => _Ultimos3qrState();
// }

// class _Ultimos3qrState extends State<Ultimos3qr> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }

//   // Future<void> _getListaQR() async {
//   //   SharedPreferences sh = await SharedPreferences.getInstance();
//   //   final listaQRs = sh.getStringList(listaQr);
//   //   state = state.copyWith(professor: prof);
//   // }

//   // Future<bool> saveQRs() async {
//   //   SharedPreferences sh = await SharedPreferences.getInstance();
//   //   try {
//   //     await sh.setString(kAvaliador, professor);
//   //     state = state.copyWith(professor: professor);
//   //     return true;
//   //   } on Exception catch (e) {
//   //     debugPrint('Erro ao gravar dado de avaliador: $e');
//   //     return false;
//   //   }
//   // }

//   Container ultimos3QR(Uint8List? imagem) {
//     return Container(
//       height: 100,
//       width: double.infinity,
//       color: Colors.blue,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               imagem != null
//                   ? Container(
//                       width: 50,
//                       height: 50,
//                       color: Colors.amber,
//                       child: Image(image: MemoryImage(imagem)),
//                     )
//                   : Container(
//                       width: 50,
//                       height: 50,
//                       color: Colors.amber,
//                     ),
//               const Text('Ultimo')
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 50,
//                 height: 50,
//                 color: Colors.amber,
//               ),
//               const Text("container 2")
//             ],
//           ),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 width: 50,
//                 height: 50,
//                 color: Colors.amber,
//               ),
//               const Text("container 3")
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
