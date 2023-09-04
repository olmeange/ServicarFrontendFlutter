import 'package:flutter/material.dart';

class LocationMainteinanceForm extends StatefulWidget {
  const LocationMainteinanceForm({super.key});

  @override
  State<LocationMainteinanceForm> createState() =>
      _LocationMainteinanceFormState();
}

class _LocationMainteinanceFormState extends State<LocationMainteinanceForm> {
  final _formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Detalles del Servicio',
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w700)),
          const SizedBox(height: 20),
          _locationTextForm(),
          const SizedBox(
            height: 20,
          ),
          _mainteinanceTextForm(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _locationTextForm() {
    List sucursales = ['Ñemby', 'Km5', '4M', 'MRA', 'Cnel. Oviedo', 'CDE'];
    return DropdownButtonFormField(
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.other_houses_outlined),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        items: sucursales.map((name) {
          return DropdownMenuItem(
            value: name,
            child: Text(name),
          );
        }).toList(),
        hint: const Text(
          "Sucursal",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        onChanged: (v) {
          //sucursalSelected(v);
        });
  }

  Widget _mainteinanceTextForm() {
    List sucursales = ['Ñemby', 'Km5', '4M', 'MRA', 'Cnel. Oviedo', 'CDE'];
    return DropdownButtonFormField(
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.car_repair),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        items: sucursales.map((name) {
          return DropdownMenuItem(
            value: name,
            child: Text(name),
          );
        }).toList(),
        hint: const Text(
          "Tipo de Mantemimiento",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        onChanged: (v) {
          //sucursalSelected(v);
        });
  }
}
