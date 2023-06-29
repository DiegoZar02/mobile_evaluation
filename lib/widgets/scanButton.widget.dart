import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:mobile_evaluation/models/scan.model.dart';
import 'package:mobile_evaluation/providers/places.provider.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  Future<void> changePage(BuildContext context, ScanModel data) async {
    await Navigator.pushNamed(
      context,
      "place",
      arguments: data,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {
        try {
          String scanResult = await FlutterBarcodeScanner.scanBarcode(
            "#111111",
            "Close",
            false,
            ScanMode.QR,
          );
          List<ScanModel> list = await PlacesProvider().readJson();

          int id = int.parse(scanResult);
          await PlacesProvider().setPlaces([scanResult]);

          if (context.mounted) {
            changePage(context, list[id - 1]);
          }
        } catch (_) {
          if (context.mounted) {
            showDialog<String>(
              context: context,
              builder: (c) => AlertDialog(
                title: const Text("QR invalido"),
                content: const Text("Este QR no es valido para esta función"),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        }
      },
    );
  }
}
