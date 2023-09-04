import 'package:flutter/material.dart';

class ClientForm extends StatefulWidget {
  const ClientForm({super.key});

  @override
  State<ClientForm> createState() => _ClientFormState();
}

class _ClientFormState extends State<ClientForm> {
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
            const Text('Datos del Cliente',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            /*Image.asset('assets/register_user.png',
                        height: 100, width: 100),
                    const SizedBox(height: 20),*/
            _firstNameTextForm(),
            const SizedBox(height: 20),
            _lastNameTextForm(),
            const SizedBox(
              height: 20,
            ),
            _addressTextForm(),
            const SizedBox(
              height: 20,
            ),
            _emailTextForm(),
            const SizedBox(
              height: 20,
            ),
            _phoneTextForm(),
            const SizedBox(
              height: 20,
            )
            //_registerButton(registerProviderSend),
          ],
        ));
  }

  Widget _firstNameTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: nameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Nombre',
          prefixIcon: const Icon(Icons.person_outlined),
          suffixIcon: IconButton(
              onPressed: () => Navigator.pushNamed(context, 'register'),
              icon: const Icon(Icons.format_list_bulleted_add)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese nombre";
        }
        return null;
      },
    );
  }

  Widget _lastNameTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: lastNameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Apellido',
          prefixIcon: const Icon(Icons.person_add_alt_1_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese apellido";
        }
        return null;
      },
    );
  }

  Widget _addressTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: lastNameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Dirección',
          prefixIcon: const Icon(Icons.home_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese dirección";
        }
        return null;
      },
    );
  }

  Widget _emailTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: nameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Correo',
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese correo";
        }
        return null;
      },
    );
  }

  Widget _phoneTextForm() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: passwordController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Teléfono',
          prefixIcon: const Icon(Icons.phone_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese teléfono";
        } else if (passwordController.text.length < 6) {
          return "Su teléfono debe tener al menos 6 caracteres";
        }
        return null;
      },
    );
  }
  // Widget properties and styling go here
}
