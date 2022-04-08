import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  Result({required this.result, required this.isMale, required this.age});
  final double result;
  final bool isMale;
  final int age;
  String get health {
    String healthiness;
    if (result >= 30)
      healthiness = 'obese';
    else if (result >= 25)
      healthiness = 'OverWeight';
    else if (result >= 18.5)
      healthiness = 'normal';
    else
      healthiness = 'thin';
    return healthiness;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Result',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Gender :${isMale ? 'Male' : 'Female'}',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'Result: ${result.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'Healthiness: ${health}',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'Age: ${age}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
