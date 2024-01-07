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
        appBar: AppBar(title: const Text('Imagen')),
        body: Center(child: _showContent(widget.item)));
  }

  Widget _showContent(item) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(item), fit: BoxFit.cover)),
    );
  }
}
