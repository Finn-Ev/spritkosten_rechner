import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Result extends StatelessWidget {
  Result(
    this.fuelCosts,
    this.fuelCostsPerPerson, {
    Key? key,
  }) : super(key: key);

  final formatCurrency = NumberFormat.simpleCurrency(locale: "de_DE");

  final double fuelCosts;
  final double fuelCostsPerPerson;

  String get primaryText => fuelCostsPerPerson != fuelCosts
      ? '${formatCurrency.format(fuelCostsPerPerson)} pro Person'
      : formatCurrency.format(fuelCosts);

  String get secondaryText =>
      fuelCostsPerPerson != fuelCosts ? '(${formatCurrency.format(fuelCosts)} gesamt)' : '';

  @override
  Widget build(BuildContext context) {
    if (fuelCosts == 0) {
      return Container();
    } else {
      return Column(
        children: [
          const Text(
            'Die Spritkosten betragen:',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            primaryText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            ),
          ),
          if (secondaryText.isNotEmpty)
            Column(
              children: [
                const SizedBox(height: 6),
                Text(
                  secondaryText,
                  style: const TextStyle(fontSize: 15),
                )
              ],
            ),
        ],
      );
    }
  }
}
