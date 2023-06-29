import 'package:flutter/material.dart';
import 'package:mobile_evaluation/pages/map.page.dart';
import 'package:mobile_evaluation/pages/places.page.dart';
import 'package:mobile_evaluation/providers/ui.provider.dart';
import 'package:mobile_evaluation/widgets/navigaroBar.widget.dart';
import 'package:mobile_evaluation/widgets/scanButton.widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text("UPC Tour"),
        ),
      ),
      body: _Body(),
      bottomNavigationBar: const CustomBottomBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<Ui>(context);

    final currentIndex = uiProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const PlacesPage();
      case 1:
        return const MapPage();

      default:
        return const Text("data");
    }
  }
}
