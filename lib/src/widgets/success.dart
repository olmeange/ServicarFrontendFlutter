import 'package:flutter/material.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.height / 6;
    return Padding(
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
            _successButton(context)
          ],
        ));
  }

  Widget _successButton(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            // The width will be 100% of the parent widget
            // The height will be 60
            textStyle: const TextStyle(fontSize: 18),
            minimumSize: const Size.fromHeight(55)),
        onPressed: () {
          //Navigator.pushNamed(context, 'home');
          Navigator.of(context)
              .pushNamedAndRemoveUntil('home', (Route<dynamic> route) => false);
        },
        child: const Text('Aceptar'));
  }
}
