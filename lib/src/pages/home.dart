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
        backgroundColor: Colors.blue,
        title: const Text(
          'Servicar MT - Opciones',
          style: TextStyle(color: Colors.white),
        ),
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
          //backgroundColor: Colors.blue,
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          elevation: 0.0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home_outlined),
                label: 'Principal',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.task),
                activeIcon: Icon(Icons.task_outlined),
                label: 'Servicios',
                backgroundColor: Colors.blue),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_3_outlined),
                activeIcon: Icon(Icons.person_3),
                label: 'Perfil del Mecánico',
                backgroundColor: Colors.blue)
          ]),
    );
  }
}
