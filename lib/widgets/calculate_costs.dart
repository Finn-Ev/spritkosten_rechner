import 'package:flutter/material.dart';
import 'package:spritkosten_rechner/widgets/number_input.dart';
import 'package:spritkosten_rechner/widgets/result.dart';

class CalculateCosts extends StatefulWidget {
  const CalculateCosts({Key? key}) : super(key: key);

  @override
  _CalculateCostsState createState() => _CalculateCostsState();
}

class _CalculateCostsState extends State<CalculateCosts> {
  final formKey = GlobalKey<FormState>();

  late String distance;
  late String consumption;
  late String price;
  String involvedPersons = '1';

  double fuelCosts = 0;
  double fuelCostsPerPerson = 0;

  void _onSubmit() {
    final isValid = formKey.currentState!.validate();

    if (isValid) {
      FocusScope.of(context).unfocus();

      distance = distance.replaceFirst(',', '.');
      consumption = consumption.replaceFirst(',', '.');
      price = price.replaceFirst(',', '.');

      double nDistance = double.parse(distance);
      double nConsumption = double.parse(consumption);
      double nPrice = double.parse(price);

      setState(() {
        fuelCosts = nDistance * nConsumption / 100 * nPrice;
      });

      if (involvedPersons.isNotEmpty) {
        double nInvolvedPersons = double.parse(involvedPersons);
        setState(() {
          fuelCostsPerPerson = fuelCosts / nInvolvedPersons;
        });
      } else {
        setState(() {
          fuelCostsPerPerson = fuelCosts;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          NumberInput(
            labelText: 'Distanz (km)',
            onChanged: (value) => setState(() => distance = value),
            maxLength: 6,
          ),
          const SizedBox(
            height: 12,
          ),
          NumberInput(
            labelText: 'Verbrauch (l/100km)',
            onChanged: (value) => setState(() => consumption = value),
            maxLength: 3,
          ),
          const SizedBox(
            height: 12,
          ),
          NumberInput(
            labelText: 'Preis pro Liter (€)',
            onChanged: (value) => setState(() => price = value),
            maxLength: 4,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text('optional:'),
          const SizedBox(
            height: 8,
          ),
          NumberInput(
            labelText: 'Anzahl der Beteiligten',
            onChanged: (value) => setState(() => involvedPersons = value),
            canBeNull: true,
            isInt: true,
            maxLength: 2,
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 50,
            child: _buildButton(),
          ),
          const SizedBox(
            height: 12,
          ),
          Result(fuelCosts, fuelCostsPerPerson)
        ],
      ),
    );
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: () => _onSubmit(),
      child: const Text(
        'Berechnen',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
