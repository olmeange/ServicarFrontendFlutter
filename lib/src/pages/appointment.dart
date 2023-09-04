import 'package:flutter/material.dart';
import 'package:servicarmt/src/form_sequence.dart';
import 'package:servicarmt/src/widgets/client_form.dart';
import 'package:servicarmt/src/widgets/location_mainteinance_form.dart';
import 'package:servicarmt/src/widgets/success.dart';
import 'package:servicarmt/src/widgets/vehicle_form.dart';

//import 'package:provider/provider.dart';
//import 'package:servicarmt/src/providers/register_provider.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  FormSequence formSequence = FormSequence(
      formShow: true,
      sequence: 0,
      showForwardButton: true,
      showBackButton: false);

  @override
  Widget build(BuildContext context) {
    //final registerProviderSend = Provider.of<RegisterProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Cita'),
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 50.0, right: 50, top: 30.0, bottom: 60.0),
                  child: Visibility(
                      visible: formSequence.formShow,
                      child: _formSelected(formSequence.sequence))))),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 65.0),
              child: Visibility(
                  visible: formSequence.showBackButton,
                  child: FloatingActionButton.extended(
                    //back button
                    heroTag: "btn1",
                    label: const Text('Atrás'),
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: () {
                      setState(() {
                        formSequence.formShow = false;
                        formSequence.sequence--;
                        formSequence.formShow = true;
                        //print(formSequence.sequence);

                        if (formSequence.sequence <= 0) {
                          formSequence.showBackButton = false;
                        }
                      });
                    },
                  ))),
          Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Visibility(
                visible: formSequence.showForwardButton,
                child: FloatingActionButton.extended(
                  //forward button
                  heroTag: "btn2",
                  label: const Text('Siguiente'),
                  icon: const Icon(Icons.arrow_forward_rounded),
                  onPressed: () {
                    setState(() {
                      formSequence.formShow = false;
                      formSequence.sequence++;
                      formSequence.formShow = true;
                      //print(formSequence.sequence);

                      if (formSequence.sequence > 0) {
                        formSequence.showBackButton = true;
                      }

                      if (formSequence.sequence >= 3) {
                        formSequence.showBackButton = false;
                        formSequence.showForwardButton = false;
                      }
                    });
                  },
                ),
              ))
        ],
      ),
    );
  }

  Widget _formSelected(int formSelected) {
    Widget selectedWidget;
    switch (formSelected) {
      case 0:
        {
          selectedWidget = const ClientForm();
        }
        break;
      case 1:
        {
          selectedWidget = const VehicleForm();
        }
        break;
      case 2:
        {
          selectedWidget = const LocationMainteinanceForm();
        }
        break;
      default:
        {
          selectedWidget = const Success();
        }
    }

    return selectedWidget;
  }
}
