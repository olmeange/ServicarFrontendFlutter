import 'package:flutter/material.dart';
//import 'package:servicarmt/src/models/maintenance_model.dart';
import 'package:servicarmt/src/models/user_model.dart';
//import 'package:servicarmt/src/services/maintenance_service.dart';
import 'package:servicarmt/src/services/user_service.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    //double widthDevice = MediaQuery.of(context).size.height / 6;
    //final UserModel userModel;
    final UserService userService = UserService();

    //final MaintenanceService maintenanceService = MaintenanceService();
    return /*const Text(
        'Hola');*/
        FutureBuilder(
            future: userService.login('pe', '123'),
            builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                print(snapshot.connectionState);
                //print(snapshot.data);
                if (snapshot.hasError) {
                  return const Text('No se encontraron datos');
                } else {
                  //userModel = snapshot.data;
                  //print(snapshot.data!.firstName.toString());
                  return Column(
                    children: [
                      const Text('Datos del Usuario',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(height: 10.0),
                      Text('Usuario:  ${snapshot.data!.userName}'),
                      Text('Nombre: ${snapshot.data!.firstName}'),
                      Text('Apellido: ${snapshot.data!.lastName}'),
                      Text('Sucursal: ${snapshot.data!.location}'),
                      //Text(snapshot.data!.locationId),
                    ],
                  );
                }
              }
            });

    /*Padding(
        padding: EdgeInsets.symmetric(horizontal: widthDevice),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Cita Agregada',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 30),
            Image.asset('assets/success.png', height: 80, width: 80),
            const SizedBox(height: 30),
          ],
        ));*/
  }
}
