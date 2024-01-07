import 'package:flutter/material.dart';

class AppointmentDetails extends StatelessWidget {
  const AppointmentDetails({super.key, required this.item});
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detalles de la cita'),
        ),
        body: Center(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: 50.0, right: 50, top: 30.0, bottom: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                Text('Fecha de creación:  ${item['date']}'),
                //Text('id: ${item['id']}'),
                Text('Cliente: ${item['client']['name']}'),
                Text('Marca del Vehículo: ${item['vehicle']['mark']}'),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        )));
  }
}
