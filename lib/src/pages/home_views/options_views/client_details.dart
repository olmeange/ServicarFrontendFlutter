import 'package:flutter/material.dart';

class ClientDetails extends StatelessWidget {
  const ClientDetails({super.key, required this.item});
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Datos del cliente',
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
                Text('Nombre: ${item['first_name']}'),
                Text('Apellido:  ${item['last_name']}'),
                Text('CI: ${item['document_id']}'),
                Text('Dirección: ${item['address']}'),
                Text('Teléfono: ${item['phone']}'),
                Text('Email: ${item['email']}'),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        )));
  }
}
