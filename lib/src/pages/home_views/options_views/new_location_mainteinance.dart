import 'package:flutter/material.dart';
import 'package:servicarmt/src/pages/home_views/options_views/success.dart';

class NewLocationMainteinance extends StatefulWidget {
  const NewLocationMainteinance({super.key});

  @override
  State<NewLocationMainteinance> createState() =>
      _NewLocationMainteinanceState();
}

class _NewLocationMainteinanceState extends State<NewLocationMainteinance> {
  final _formState = GlobalKey<FormState>();
  String location = 'EMPTY';
  String mainteinance = 'EMPTY';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Agregar Servicio y Sucursal',
          style: TextStyle(color: Colors.white),
        ),
        leading: BackButton(
          color: Colors.white,
          onPressed: () {
            // do your navigate here
            //print("back click");
            //salir de tres vistas para volver a lista de citas
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, top: 30.0, bottom: 60.0),
                  child: _locationMainteinanceForm()))),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: FloatingActionButton.extended(
                //back button
                backgroundColor: Colors.blue,
                heroTag: "btn1",
                label: const Text(
                  'Atrás',
                  style: TextStyle(color: Colors.white),
                ),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                ),
                onPressed: () {
                  //setState(() {});
                  Navigator.pop(context);
                },
              )),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FloatingActionButton.extended(
              //forward button
              backgroundColor: Colors.blue,
              heroTag: "btn2",
              label: const Text(
                'Siguiente',
                style: TextStyle(color: Colors.white),
              ),
              icon: const Icon(
                Icons.arrow_forward_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  //print(location);
                  //print(mainteinance);
                });
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Success(
                              fromAppointments: true,
                              numberOfJumps: 4,
                            )));
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _locationMainteinanceForm() {
    return Form(
      key: _formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Servicio y sucursal',
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
    List locations = ['Ñemby', 'Km5', '4M', 'MRA', 'Cnel. Oviedo', 'CDE'];
    return Material(
      child: DropdownButtonFormField(
          decoration: InputDecoration(
              floatingLabelStyle: const TextStyle(color: Colors.blue),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 2.0),
              ),
              prefixIcon: const Icon(Icons.other_houses_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              )),
          items: locations.map((name) {
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
            //print(v);
            location = v.toString();
          }),
    );
  }

  Widget _mainteinanceTextForm() {
    List mainteinances = [
      'Cambio de aceite',
      'Cambio de filtros',
      'Presión de llantas',
      'Alineación y balanceo',
      'Revisión de estado de batería',
      'Revisión de fluído de freno',
      'Mecánica ligera',
      'Revisión de amortiguadores',
      'Cambio de aceite de caja'
    ];
    return Material(
        child: DropdownButtonFormField(
            decoration: InputDecoration(
                floatingLabelStyle: const TextStyle(color: Colors.blue),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 2.0),
                ),
                prefixIcon: const Icon(Icons.car_repair),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
            items: mainteinances.map((name) {
              return DropdownMenuItem(
                value: name,
                child: Text(name),
              );
            }).toList(),
            hint: const Text(
              "Tipo de Mantenimiento",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onChanged: (v) {
              //sucursalSelected(v);
              //print(v);
              mainteinance = v.toString();
            }));
  }
}
