import 'package:flutter/material.dart';
import 'package:mobile_evaluation/models/scan.model.dart';

class CustomCard extends StatelessWidget {
  final ScanModel data;
  const CustomCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, "place", arguments: data);
      },
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.zero),
        backgroundColor: MaterialStatePropertyAll(Colors.transparent),
      ),
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(data.image),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.bottomLeft,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withAlpha(0),
                Colors.white30.withAlpha(0),
                Colors.black.withAlpha(150),
              ],
            ),
          ),
          child: Text(
            "[${data.id}] ${data.title}",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white.withAlpha(200),
            ),
          ),
        ),
      ),
    );
  }
}
