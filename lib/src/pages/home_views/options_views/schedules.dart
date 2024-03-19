import 'package:flutter/material.dart';
import 'package:servicarmt/src/list_flags_controller.dart';
import 'package:servicarmt/src/pages/home_views/options_views/new_schedule.dart';
import 'package:servicarmt/src/pages/home_views/options_views/schedule_details.dart';
import 'package:servicarmt/src/services/Schedule_service.dart';

class Schedules extends StatefulWidget {
  const Schedules({super.key});

  @override
  State<Schedules> createState() => _SchedulesState();
}

class _SchedulesState extends State<Schedules> {
  final ScheduleService scheduleService = ScheduleService();

  // Clase que contiene las banderas para controlar adecuadamente la carga del listview
  final ListFlagsController listFlagsController = ListFlagsController();

  // This holds the posts fetched from the server
  List _posts = [];

  // The controller for the ListView
  late ScrollController _controller;

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      listFlagsController.isFirstLoadRunning = true;
    });

    final data = await scheduleService.getSchedulesPerPage(
        listFlagsController.page, '2');
    if (scheduleService.statusCode == 1000) {
      setState(() {
        _posts = data;
      });
    }

    setState(() {
      listFlagsController.isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    // si el resultado del status code de first load es correcto se podria pedir otros 10 elementos
    if (scheduleService.statusCode == 1000 &&
        _controller.position.pixels == _controller.position.maxScrollExtent &&
        listFlagsController.hasNextPage) {
      setState(() {
        // Display a progress indicator at the bottom
        listFlagsController.isFirstLoadRunning = true;
      });
      listFlagsController.page += 1; // Increase _page by 1

      final data = await scheduleService.getSchedulesPerPage(
          listFlagsController.page, '2');
      if (!data.contains('EMPTY')) {
        setState(() {
          _posts.addAll(data);
        });

        if (data.length < 10) {
          setState(() {
            listFlagsController.hasNextPage = false;
          });
        }
      }

      setState(() {
        listFlagsController.isFirstLoadRunning = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _firstLoad();
    _controller = ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Agendamientos',
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(color: Colors.white),
        actions: [
          IconButton(
              color: Colors.white,
              icon: const Icon(Icons.note_add_outlined),
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NewSchedule(
                                //fromVehicles: true,
                                )))
                  })
        ],
      ),
      body: listFlagsController.isFirstLoadRunning
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    controller: _controller,
                    itemCount: _posts.length,
                    itemBuilder: (_, index) => Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 10),
                      child: ListTile(
                        onTap: () {
                          //print(index);
                          //Navigator.pushNamed(context, 'appointment_details');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ScheduleDetails(item: _posts[index])));
                        },
                        title: Text(_posts[index]['date']),
                        subtitle: Text(_posts[index]['appointment_id']),
                      ),
                    ),
                  ),
                ),

                // when the _loadMore function is running
                if (listFlagsController.isLoadMoreRunning)
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                if (!listFlagsController.hasNextPage)
                  Container(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    color: Colors.blue,
                    child: const Center(
                      child: Text(
                        'Lista de agendamientos completa',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
