import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success(
      {super.key, required this.fromAppointments, required this.numberOfJumps});
  final bool fromAppointments;
  final int numberOfJumps;

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text('Cita agregada'),
        leading: BackButton(
          onPressed: () {
            //do your navigate here
            //print("back click");
            //salir de cuatro vistas para volver a lista de citas

            switch (widget.numberOfJumps) {
              case 1:
                {
                  // statements;
                  Navigator.pop(context);
                }
                break;

              case 2:
                {
                  //statements;
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                break;

              case 3:
                {
                  //statements;
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                break;

              case 4:
                {
                  //statements;
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.pop(context);
                }
                break;

              default:
                {
                  //statements;
                }
                break;
            }

            /*if (widget.fromAppointments) {
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
              Navigator.pop(context);
            } else {
              Navigator.pop(context);
              Navigator.pop(context);
            }*/
          },
        ),
      ),
      body: Center(
          child: SingleChildScrollView(
              child: Padding(
                  padding: const EdgeInsets.only(
                      left: 25.0, right: 25, top: 30.0, bottom: 60.0),
                  child: _successView()))),
    );
  }

  Widget _successView() {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Agregado',
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w700)),
        const Text('exitosamente',
            style: TextStyle(
                color: Colors.blue, fontSize: 20, fontWeight: FontWeight.w700)),
        const SizedBox(height: 30),
        Image.asset('assets/success.png', height: 80, width: 80),
        const SizedBox(height: 60),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: _successButton(context))
      ],
    ));
  }

  Widget _successButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(fontSize: 18),
            minimumSize: const Size.fromHeight(55)),
        onPressed: () {
          Navigator.of(context)
              .pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);
        },
        child: const Text('Ir a principal'));
  }
}
