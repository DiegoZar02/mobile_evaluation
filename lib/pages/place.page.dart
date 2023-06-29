import 'package:flutter/material.dart';
import 'package:mobile_evaluation/models/scan.model.dart';

class PlacePage extends StatelessWidget {
  const PlacePage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScanModel;
    final List<String> texts = args.description;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(args.image),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
          ),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  args.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                Expanded(
                  child: SizedBox(
                    child: ListView.builder(
                      itemCount: texts.length,
                      itemBuilder: (c, i) {
                        return Column(
                          children: [
                            Text(
                              texts[i],
                              style: const TextStyle(fontSize: 15),
                              textAlign: TextAlign.justify,
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
