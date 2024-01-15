import 'package:flutter/material.dart';
import 'package:servicarmt/src/pages/home_views/options_views/appointments.dart';
import 'package:servicarmt/src/pages/home_views/options_views/schedule_image_video.dart';
//import 'package:servicarmt/src/pages/home_views/options_views/success.dart';

class NewSchedule extends StatefulWidget {
  const NewSchedule({super.key});

  @override
  State<NewSchedule> createState() => _NewScheduleState();
}

class _NewScheduleState extends State<NewSchedule> {
  final _formState = GlobalKey<FormState>();
  final idAppointmentController = TextEditingController();
  final chassisController = TextEditingController();
  final kmController = TextEditingController();
  final userController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Agendamiento'),
        leading: BackButton(
          onPressed: () {
            // do your navigate here
            //print("back click");
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, top: 30.0, bottom: 60.0),
                  child: _scheduleForm()))),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: FloatingActionButton.extended(
            //forward button
            heroTag: "btn2",
            label: const Text('Siguiente'),
            icon: const Icon(Icons.arrow_forward_rounded),
            onPressed: () {
              setState(() {
                //print(idAppointmentController.text);
                //print(chassisController.text);
                //print(kmController.text);
                //print(userController.text);
              });

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ScheduleImageVideo(
                          //fromAppointments: false,
                          )));
            }),
      ),
    );
  }

  Widget _scheduleForm() {
    return Form(
        key: _formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Datos del Agendamiento',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            /*Image.asset('assets/register_user.png',
                        height: 100, width: 100),
                    const SizedBox(height: 20),*/
            _idAppointmentTextForm(),
            const SizedBox(height: 20),
            _chassisTextForm(),
            const SizedBox(
              height: 20,
            ),
            _kmTextForm(),
            const SizedBox(
              height: 20,
            ),
            _userTextForm(),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  Widget _idAppointmentTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: idAppointmentController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Id de la cita',
          prefixIcon: const Icon(Icons.person_outlined),
          suffixIcon: //widget.fromVehicles
              //? const SizedBox(height: 0.0, width: 0.0):
              IconButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Appointments(
                                  enableAppointmentDetails: false,
                                )));
                    setState(() {
                      if (result != null) {
                        idAppointmentController.text = result['id'];
                        //print(result);
                      }
                    });
                  },
                  icon: const Icon(Icons.format_list_bulleted_add)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese id la cita";
        }
        return null;
      },
    ));
  }

  Widget _chassisTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: chassisController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Chassis',
          prefixIcon: const Icon(Icons.person_add_alt_1_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese chassis";
        }
        return null;
      },
    ));
  }

  Widget _kmTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: kmController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Km',
          prefixIcon: const Icon(Icons.home_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese km";
        }
        return null;
      },
    ));
  }

  Widget _userTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: userController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Id del mecánico',
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese id del mecánico";
        }
        return null;
      },
    ));
  }
}
