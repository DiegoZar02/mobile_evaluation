import 'package:flutter/material.dart';
import 'package:mobile_evaluation/models/scan.model.dart';
import 'package:mobile_evaluation/providers/places.provider.dart';
import 'package:mobile_evaluation/widgets/customCard.widget.dart';
import 'package:provider/provider.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as String;

    final int id = int.parse(args);
    final data = Provider.of<PlacesProvider>(context);

    return Scaffold(
      body: FutureBuilder(
        future: data.readJson(),
        builder: (context, data) {
          if (data.hasError) return const Text("Error");

          if (data.hasData) {
            var items = data.data as List<ScanModel>;
            return CustomCard(data: items[id - 1]);
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
