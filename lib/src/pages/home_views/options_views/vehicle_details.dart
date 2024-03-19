import 'package:flutter/material.dart';

class VehicleDetails extends StatelessWidget {
  const VehicleDetails({super.key, required this.item});
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Datos del vehículo',
            style: TextStyle(color: Colors.white),
          ),
          leading: const BackButton(color: Colors.white),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 50.0, right: 50, top: 30.0, bottom: 60.0),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                //Text('id: ${item['id']}'),
                Text('Marca:  ${item['mark']}'),
                Text('Modelo: ${item['model']}'),
                Text('Año: ${item['year']}'),
                Text('Chapa: ${item['plate']}'),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        )));
  }
}
