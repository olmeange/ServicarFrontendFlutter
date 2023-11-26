import 'package:flutter/material.dart';

//import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import 'package:servicarmt/src/models/user_model.dart';
import 'package:servicarmt/src/providers/login_provider.dart';
import 'package:servicarmt/src/services/login_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formState = GlobalKey<FormState>();
  final userController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPass = false;

  @override
  Widget build(BuildContext context) {
    final loginProviderSend = Provider.of<LoginProvider>(context);
    //double heightDevice = MediaQuery.of(context).size.height / 3.5;
    //double widthDevice = MediaQuery.of(context).size.height / 3.5;

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 50.0, right: 50.0),
        child: Form(
            key: _formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text('Servicar MT',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 33,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 20),
                Image.asset('assets/car_tool.png', height: 120, width: 120),
                const SizedBox(height: 20),
                _userTextForm(),
                const SizedBox(height: 20),
                _passwordTextForm(),
                const SizedBox(
                  height: 20,
                ),
                _loginButton(loginProviderSend),
                const SizedBox(
                  height: 15,
                ),
                _registerButton(),
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

  Widget _userTextForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: userController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Usuario',
          prefixIcon: const Icon(Icons.person_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese usuario";
        }
        return null;
      },
    );
  }

  Widget _passwordTextForm() {
    return TextFormField(
      obscureText: !showPass,
      keyboardType: TextInputType.text,
      controller: passwordController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Constraseña',
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

  Widget _loginButton(LoginProvider loginProviderSend) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // The width will be 100% of the parent widget
          // The height will be 60
          textStyle: const TextStyle(fontSize: 18),
          minimumSize: const Size.fromHeight(55)),
      onPressed: () {
        if (_formState.currentState!.validate()) {
          //print('Datos válidos');
          //emailController.clear();
          //passwordController.clear();
          //loginProviderSend.userText = userController.text;
          //loginProviderSend.passwordText = passwordController.text;

          final LoginService loginService = LoginService();
          loginService
              .login(userController.text, passwordController.text)
              .then((response) {
            if (response.statusCode == 1000) {
              final UserModel userModel = UserModel(
                  user: User(
                      firstName: response.user!.firstName!,
                      lastName: response.user!.lastName!,
                      id: response.user!.id!,
                      location: response.user!.location!,
                      password: response.user!.password!,
                      userName: response.user!.userName!),
                  statusCode: response.statusCode!);

              loginProviderSend.userModel = userModel;

              Navigator.pushNamed(context, 'home');
            } else {
              if (response.statusCode == 1001) {
                //mostrar un toast u otra opcion
                //print(response.message);
                //print("No se loguea");
              }
            }
          });

          /*var route = ModalRoute.of(context);
          if (route != null) {
            print(route.settings.name.toString());
          }*/
        }
      },
      child: const Text('Iniciar Sesion'),
    );
  }

  Widget _registerButton() {
    return TextButton(
      onPressed: () => Navigator.pushNamed(context, 'register'),
      child: const Text(
        'Registrarse',
        style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: 16,
            color: Colors.blue),
      ),
    );
  }
}
