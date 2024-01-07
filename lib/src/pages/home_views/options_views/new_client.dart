import 'package:flutter/material.dart';
import 'package:servicarmt/src/pages/home_views/options_views/clients.dart';
import 'package:servicarmt/src/pages/home_views/options_views/new_vehicle.dart';
import 'package:servicarmt/src/pages/home_views/options_views/success.dart';

class NewClient extends StatefulWidget {
  const NewClient({super.key, required this.fromClients});
  final bool fromClients;

  @override
  State<NewClient> createState() => _NewClientState();
}

class _NewClientState extends State<NewClient> {
  final _formState = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final addressController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //final registerProviderSend = Provider.of<RegisterProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Agregar Cliente'),
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
                    child: _clientForm()))),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: FloatingActionButton.extended(
            //forward button
            heroTag: "btn2",
            label: const Text('Siguiente'),
            icon: const Icon(Icons.arrow_forward_rounded),
            onPressed: () {
              setState(() {
                //print(nameController.text);
                //print(lastNameController.text);
                //print(addressController.text);
                //print(emailController.text);
                //print(phoneController.text);
              });
              if (widget.fromClients) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Success(
                              fromAppointments: false,
                            )));
              } else {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NewVehicle(
                              fromVehicles: false,
                            )));
              }
            },
          ),
        ));
  }

  Widget _clientForm() {
    return Form(
        key: _formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Datos del Cliente',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700)),
            const SizedBox(height: 20),
            _firstNameTextForm(),
            const SizedBox(height: 20),
            _lastNameTextForm(),
            const SizedBox(
              height: 20,
            ),
            _addressTextForm(),
            const SizedBox(
              height: 20,
            ),
            _emailTextForm(),
            const SizedBox(
              height: 20,
            ),
            _phoneTextForm(),
            const SizedBox(
              height: 20,
            )
          ],
        ));
  }

  Widget _firstNameTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: nameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Nombre',
          prefixIcon: const Icon(Icons.person_outlined),
          suffixIcon: widget.fromClients
              ? const SizedBox(height: 0.0, width: 0.0)
              : IconButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const Clients(enableClientDetails: false))
                        //'clients',
                        //arguments: {'client_details_disabled': true},
                        );
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
                        nameController.text = result['first_name'];
                        lastNameController.text = result['last_name'];
                        addressController.text = result['address'];
                        emailController.text = result['email'];
                        phoneController.text = result['phone'];
                        //print(result);
                      }
                    });
                  },
                  icon: const Icon(Icons.format_list_bulleted_add)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese nombre";
        }
        return null;
      },
    ));
  }

  Widget _lastNameTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: lastNameController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Apellido',
          prefixIcon: const Icon(Icons.person_add_alt_1_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese apellido";
        }
        return null;
      },
    ));
  }

  Widget _addressTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: addressController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Dirección',
          prefixIcon: const Icon(Icons.home_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese dirección";
        }
        return null;
      },
    ));
  }

  Widget _emailTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.text,
      controller: emailController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Correo',
          prefixIcon: const Icon(Icons.email_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese correo";
        }
        return null;
      },
    ));
  }

  Widget _phoneTextForm() {
    return Material(
        child: TextFormField(
      keyboardType: TextInputType.phone,
      controller: phoneController,
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          labelText: 'Teléfono',
          prefixIcon: const Icon(Icons.phone_outlined),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      validator: (value) {
        if (value!.isEmpty) {
          return "Ingrese teléfono";
        } else if (phoneController.text.length < 6) {
          return "Su teléfono debe tener al menos 6 caracteres";
        }
        return null;
      },
    ));
  }
}
