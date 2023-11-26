import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:servicarmt/src/models/maintenance_model.dart';
import 'package:servicarmt/src/models/user_model.dart';
import 'package:servicarmt/src/providers/login_provider.dart';
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
    //double widthDevice = MediaQuery.of(context).size.height;
    //final UserModel userModel;
    final UserService userService = UserService();
    final loginProviderRecieved = Provider.of<LoginProvider>(context);

    //final MaintenanceService maintenanceService = MaintenanceService();
    return /*const Text(
        'Hola');*/
        FutureBuilder(
            future:
                userService.getUser(loginProviderRecieved.userModel.user!.id!),
            //userService.getUser('1010'),
            builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else {
                //print(snapshot.connectionState);
                //print(snapshot.data);
                //print(snapshot.hasError);
                if (snapshot.hasError) {
                  return const Text('No se encontraron datos');
                  //return Text('${snapshot.data!.message}');
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
                      Text('Usuario:  ${snapshot.data!.user!.userName}'),
                      Text('Nombre: ${snapshot.data!.user!.firstName}'),
                      Text('Apellido: ${snapshot.data!.user!.lastName}'),
                      Text('Sucursal: ${snapshot.data!.user!.location}'),
                      //Text(snapshot.data!.locationId),
                    ],
                  );
                }
              }
            });

    /*Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200.0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Datos del Usuario',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 10.0),
                Text('Usuario:  ${loginProviderRecieved.user.userName}'),
                Text('Nombre: ${loginProviderRecieved.user.firstName}'),
                Text('Apellido: ${loginProviderRecieved.user.lastName}'),
                Text('Sucursal: ${loginProviderRecieved.user.location}'),
                //Text(snapshot.data!.locationId),
              ],
            ));*/
  }
}
