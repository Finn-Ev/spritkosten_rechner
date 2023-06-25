import 'package:spritkosten_rechner/screens/home/info_screen.dart';
import 'package:spritkosten_rechner/widgets/calculate_costs.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Spritkosten-Rechner',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const InfoScreen(),
              ),
            ),
            style: TextButton.styleFrom(primary: Colors.white),
            child: const Icon(
              Icons.info_outline,
              size: 32,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Card(
              margin: EdgeInsets.fromLTRB(12, 12, 12, 0),
              child: Padding(
                padding: EdgeInsets.all(12),
                child: CalculateCosts(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
