import 'package:flutter/material.dart';
import 'package:servicarmt/src/pages/home_views/options_view.dart';
import 'package:servicarmt/src/pages/home_views/user_view.dart';
//import 'package:provider/provider.dart';

//import 'package:servicarmt/src/providers/login_provider.dart';
//import 'package:servicarmt/src/providers/register_provider.dart';
//import 'package:http/http.dart'; as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedIndex = 0;

  /*Future getSucursal() async{
    var response = await http.get('');
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
    var itemCount = jsonResponse['totalItems'];
    //print('Number of books about http: $itemCount.');
  } else {
    //print('Request failed with status: ${response.statusCode}.');
  }
  }*/

  @override
  Widget build(BuildContext context) {
    //final loginProviderRecieve = Provider.of<LoginProvider>(context);
    //final registerProviderRecieve = Provider.of<RegisterProvider>(context);
    final views = [const OptionsView(), const OptionsView(), const UserView()];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Servicar MT - Opciones'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 0.0),
            child: views[selectedIndex]
            /*IndexedStack(
          index: selectedIndex,
          children: views,*/
            ),
      )),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          elevation: 0.0,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                activeIcon: const Icon(Icons.home_outlined),
                label: 'Principal',
                backgroundColor: Theme.of(context).colorScheme.primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.task),
                activeIcon: const Icon(Icons.task_outlined),
                label: 'Servicios',
                backgroundColor: Theme.of(context).colorScheme.tertiary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person_3_outlined),
                activeIcon: const Icon(Icons.person_3),
                label: 'Perfil del Mecánico',
                backgroundColor: Theme.of(context).colorScheme.tertiary)
          ]),
    );
  }
}
