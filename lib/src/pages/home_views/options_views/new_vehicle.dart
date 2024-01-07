import 'package:flutter/material.dart';
import 'package:servicarmt/src/pages/home_views/options_views/new_location_mainteinance.dart';
import 'package:servicarmt/src/pages/home_views/options_views/success.dart';
import 'package:servicarmt/src/pages/home_views/options_views/vehicles.dart';

class NewVehicle extends StatefulWidget {
  const NewVehicle({super.key, required this.fromVehicles});
  final bool fromVehicles;

  @override
  State<NewVehicle> createState() => _NewVehicleState();
}

class _NewVehicleState extends State<NewVehicle> {
  final _formState = GlobalKey<FormState>();
  final markController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final plateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Vehículo'),
        leading: BackButton(
          onPressed: () {
            // do your navigate here
            //print("back click");
            //salir de dos vistas para volver a lista de citas
            if (widget.fromVehicles) {
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, top: 30.0, bottom: 60.0),
                  child: _vehicleForm()))),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
              visible: !widget.fromVehicles,
              child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: FloatingActionButton.extended(
                    //back button
                    heroTag: "btn1",
                    label: const Text('Atrás'),
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      Navigator.pop(context);
                      //setState(() {});
                    },
                  ))),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FloatingActionButton.extended(
                //forward button
                heroTag: "btn2",
                label: const Text('Siguiente'),
                icon: const Icon(Icons.arrow_forward_rounded),
                onPressed: () {
                  setState(() {
                    //print(markController.text);
                    //print(modelController.text);
                    //print(yearController.text);
                    //print(plateController.text);
                  });
                  if (widget.fromVehicles) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Success(fromAppointments: false)));
                  } else {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const NewLocationMainteinance()));
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget _vehicleForm() {
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
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: markController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Marca',
          prefixIcon: const Icon(Icons.person_outlined),
          suffixIcon: widget.fromVehicles
              ? const SizedBox(height: 0.0, width: 0.0)
              : IconButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Vehicles(enableVehicleDetails: false)));
                    setState(() {
                      /*final appointmentProvider =
                      Provider.of<AppointmentProvider>(context);
                  appointmentProvider.client = Client(
                      firstName: result['first_name'],
                      lastName: result['last_name'],
                      address: result['address'],
                      email: result['email'],
                      phone: result['phone']);*/
                      if (result != null) {
                        markController.text = result['mark'];
                        modelController.text = result['model'];
                        yearController.text = result['year'];
                        plateController.text = result['plate'];
                        //print(result);
                      }
                    });
                  },
                  icon: const Icon(Icons.format_list_bulleted_add)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese marca";
        }
        return null;
      },
    ));
  }

  Widget _modelTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: modelController,
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
    ));
  }

  Widget _yearTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: yearController,
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
    ));
  }

  Widget _plateTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: plateController,
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
    ));
  }
  // Widget properties and styling go here
}
