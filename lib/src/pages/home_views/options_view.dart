import 'package:flutter/material.dart';
import 'package:servicarmt/src/pages/home_views/options_views/appointments.dart';
import 'package:servicarmt/src/pages/home_views/options_views/clients.dart';
import 'package:servicarmt/src/pages/home_views/options_views/vehicles.dart';

class OptionsView extends StatefulWidget {
  const OptionsView({super.key});

  @override
  State<OptionsView> createState() => _OptionsViewState();
}

class _OptionsViewState extends State<OptionsView> {
  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(children: [
          _createRoundedButton(Icons.person_outlined, 'Clientes', 0),
          _createRoundedButton(Icons.car_repair_outlined, 'Vehículos', 1)
        ]),
        TableRow(children: [
          _createRoundedButton(Icons.add_comment_outlined, 'Citas', 2),
          _createRoundedButton(Icons.fact_check_outlined, 'Agendamientos', 3)
        ]),
        TableRow(children: [
          _createRoundedButton(
              Icons.done_all_sharp, 'Servicios Finalizados', 4),
          _createRoundedButton(Icons.list_outlined, 'Servicios  Pendientes', 5)
        ]),
        TableRow(children: [
          _createRoundedButton(Icons.search_rounded, 'Buscar', 6),
          _createRoundedButton(Icons.calendar_month, 'Calendario', 7)
        ]),
      ],
    );
  }

  Widget _createRoundedButton(IconData icon, String function, int option) {
    return Container(
      height: 120.0,
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: () => _optionSelected(option),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(height: 2.0),
            CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 25.0,
              child: Icon(icon, color: Colors.white, size: 25.0),
            ),
            Center(
                child: Text(function,
                    style: const TextStyle(color: Colors.blue),
                    textAlign: TextAlign.center)),
            const SizedBox(height: 2.0),
          ],
        ),
      ),
    );
  }

  _optionSelected(int option) {
    switch (option) {
      case 0:
        {
          // statements;
          //Navigator.pushNamed(context, 'clients');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Clients(enableClientDetails: true))
              //'clients',
              //arguments: {'client_details_disabled': true},
              );
        }
        break;

      case 1:
        {
          // statements;
          //Navigator.pushNamed(context, 'vehicles');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Vehicles(enableVehicleDetails: true))
              //'clients',
              //arguments: {'client_details_disabled': true},
              );
        }
        break;

      case 2:
        {
          //print('Opcion citas');
          //Navigator.pushNamed(context, 'appointments');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const Appointments(enableAppointmentDetails: true))
              //'clients',
              //arguments: {'client_details_disabled': true},
              );
        }
        break;

      case 3:
        {
          //statements;
          Navigator.pushNamed(context, 'schedules');
        }
        break;

      case 4:
        {
          //statements;
        }
        break;

      case 5:
        {
          //statements;
        }
        break;

      case 6:
        {
          //statements;
        }
        break;

      case 7:
        {
          //statements;
        }
        break;

      default:
        {
          //statements;
        }
        break;
    }
  }
}
