import 'package:flutter/material.dart';

class VehicleForm extends StatefulWidget {
  const VehicleForm({super.key});

  @override
  State<VehicleForm> createState() => _VehicleFormState();
}

class _VehicleFormState extends State<VehicleForm> {
  final _formState = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Datos del Vehículo',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            /*Image.asset('assets/register_user.png',
                        height: 100, width: 100),
                    const SizedBox(height: 20),*/
            _markTextForm(),
            const SizedBox(height: 20),
            _modelTextForm(),
            const SizedBox(
              height: 20,
            ),
            _yearTextForm(),
            const SizedBox(
              height: 20,
            ),
            _plateTextForm(),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  Widget _markTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: nameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Marca',
          prefixIcon: const Icon(Icons.person_outlined),
          suffixIcon: IconButton(
              onPressed: () => Navigator.pushNamed(context, 'register'),
              icon: const Icon(Icons.format_list_bulleted_add)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese marca";
        }
        return null;
      },
    );
  }

  Widget _modelTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: lastNameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Modelo',
          prefixIcon: const Icon(Icons.person_add_alt_1_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese modelo";
        }
        return null;
      },
    );
  }

  Widget _yearTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: lastNameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Año',
          prefixIcon: const Icon(Icons.home_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese año";
        }
        return null;
      },
    );
  }

  Widget _plateTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: nameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Chapa',
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese chapa";
        }
        return null;
      },
    );
  }
  // Widget properties and styling go here
}
