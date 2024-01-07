import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicarmt/src/providers/register_provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formState = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    final registerProviderSend = Provider.of<RegisterProvider>(context);

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 25.0, right: 25.0, top: 60.0, bottom: 60.0),
        child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Registrarse a ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
                const Text('Servicar MT ',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 20),
                Image.asset('assets/register_user.png',
                    height: 100, width: 100),
                const SizedBox(height: 20),
                _nameTextForm(),
                const SizedBox(height: 20),
                _lastNameTextForm(),
                const SizedBox(
                  height: 20,
                ),
                _locationTextForm(),
                const SizedBox(
                  height: 20,
                ),
                _passwordTextForm(),
                const SizedBox(
                  height: 20,
                ),
                _registerButton(registerProviderSend),
              ],
            )),
      ),
    )));
  }

  void togglePass() {
    setState(() {
      showPass = !showPass;
    });
  }

  Widget _nameTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: nameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Nombre',
          prefixIcon: const Icon(Icons.person_outlined),
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

  Widget _passwordTextForm() {
    return TextFormField(
      obscureText: !showPass,
      keyboardType: TextInputType.text,
      controller: passwordController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Contraseña',
          prefixIcon: const Icon(Icons.lock_outlined),
          suffixIcon: IconButton(
            onPressed: togglePass,
            icon: showPass
                ? const Icon(Icons.visibility)
                : const Icon(
                    Icons.visibility_off,
                  ),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese contraseña";
        } else if (passwordController.text.length < 6) {
          return "Su contraseña debe tener al menos 6 caracteres";
        }
        return null;
      },
    );
  }

  Widget _registerButton(RegisterProvider registerProviderSend) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // The width will be 100% of the parent widget
          // The height will be 60
          textStyle: const TextStyle(fontSize: 18),
          minimumSize: const Size.fromHeight(55)),
      onPressed: () {
        //loginUser;
        //print('boton presionado');
        if (_formState.currentState!.validate()) {
          //print('Datos válidos');
          //emailController.clear();
          //passwordController.clear();
          registerProviderSend.nameText = nameController.text;
          registerProviderSend.passwordText = passwordController.text;
          Navigator.pushNamed(context, 'home');
        }
      },
      child: const Text('Registrarme'),
    );
  }
}
