import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      alignment: Alignment.bottomCenter,
      child: PhotoView(
        imageProvider: const AssetImage("assets/map.png"),
        minScale: 0.06,
        maxScale: 1.0,
        backgroundDecoration: BoxDecoration(
          color: Colors.white.withAlpha(0),
        ),
      ),
    );
  }
}
