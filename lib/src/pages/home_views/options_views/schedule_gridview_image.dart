import 'package:flutter/material.dart';

class ScheduleGridviewImage extends StatefulWidget {
  const ScheduleGridviewImage({super.key, required this.item});
  final String item;

  @override
  State<ScheduleGridviewImage> createState() => _ScheduleGridviewImageState();
}

class _ScheduleGridviewImageState extends State<ScheduleGridviewImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'Imagen',
            style: TextStyle(color: Colors.white),
          ),
          leading: const BackButton(
            color: Colors.white,
          ),
        ),
        body: Center(child: _showContent(widget.item)));
  }

  Widget _showContent(item) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(item), fit: BoxFit.cover)),
    );
  }
}
