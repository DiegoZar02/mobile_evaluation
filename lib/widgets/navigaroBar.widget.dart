import 'package:flutter/material.dart';
import 'package:mobile_evaluation/providers/ui.provider.dart';
import 'package:provider/provider.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<Ui>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      onTap: (int i) => uiProvider.selectedMenuOpt = i,
      currentIndex: currentIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.place),
          label: "Lugares",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: "Mapa",
        ),
      ],
    );
  }
}
