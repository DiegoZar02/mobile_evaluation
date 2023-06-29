import 'package:flutter/material.dart';
import 'package:mobile_evaluation/models/scan.model.dart';
import 'package:mobile_evaluation/providers/places.provider.dart';
import 'package:mobile_evaluation/widgets/customCard.widget.dart';
import 'package:provider/provider.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({super.key});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}

class _PlacesPageState extends State<PlacesPage> {
  @override
  Widget build(BuildContext context) {
    final places = Provider.of<PlacesProvider>(context);

    return Center(
      child: FutureBuilder(
        future: places.displayPlaces(),
        builder: (context, data) {
          if (data.hasError) return const Text("Error");

          if (data.hasData) {
            final items = data.data as List<ScanModel>;

            return items.isNotEmpty
                ? ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      return CustomCard(data: items[i]);
                    },
                  )
                : const Center(
                    child: Text("Sin lugares decubiertos"),
                  );
          }

          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
