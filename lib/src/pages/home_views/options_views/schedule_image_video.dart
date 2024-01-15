//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:servicarmt/src/pages/home_views/options_views/schedule_gridview_video.dart';
//import 'package:servicarmt/src/pages/home_views/options_views/schedule_gridview_image.dart';
import 'dart:io' show File; //Platform;
//import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:servicarmt/src/pages/home_views/options_views/success.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class ScheduleImageVideo extends StatefulWidget {
  const ScheduleImageVideo({super.key});

  @override
  State<ScheduleImageVideo> createState() => _ScheduleImageVideoState();
}

class _ScheduleImageVideoState extends State<ScheduleImageVideo> {
  final List items = [];
  final List paths = [];
  final dynamic images = [];
  final dynamic videos = [];
  //final String imgUrl = 'http://192.168.100.14:5000/api/image/';
  //final String thumbnailUrl = 'http://192.168.100.14:5000/api/thumbnail/';
  //final String vidUrl = 'http://192.168.100.14:5000/api/video/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Agregar Agendamiento'),
        actions: [
          IconButton(
              icon: const Icon(Icons.note_add_outlined),
              onPressed: () => {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) =>
                            _showCustomBottomSheet(context))
                  })
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10.0),
                const Text('Agrega fotos y vídeos del vehículo',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16,
                        fontWeight: FontWeight.w700)),
                const SizedBox(height: 25.0),
                SizedBox(
                    height: 400,
                    child: GridView.builder(
                        itemCount: paths.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return (getFileExtension(items[index].path) != 'mp4')
                              ? _gridImageItem(paths[index])
                              : _gridVideoItem(paths[index]);
                        }))
              ]),
        ),
      )),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: FloatingActionButton.extended(
          //forward button
          heroTag: "btn1",
          label: const Text('Siguiente'),
          icon: const Icon(Icons.arrow_forward_rounded),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const Success(
                          fromAppointments: false,
                          numberOfJumps: 3,
                        )));
          },
        ),
      ),
    );
  }

  Widget _showCustomBottomSheet(BuildContext context) {
    return SizedBox(
      height: 165, //278
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(20.0), bottom: Radius.circular(20.0))),
        margin: const EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _selectImage(0);
                      Navigator.pop(context);
                    },
                    child: iconBottomSheet(context, Icons.camera_alt_outlined,
                        Colors.blue, 'Foto'),
                  ),
                  const SizedBox(width: 40),
                  InkWell(
                    onTap: () {
                      _selectVideo();
                      Navigator.pop(context);
                    },
                    child: iconBottomSheet(context, Icons.video_call_outlined,
                        Colors.blue, 'Vídeo'),
                  ),
                  const SizedBox(width: 40),
                  InkWell(
                      onTap: () {
                        _selectImage(1);
                        Navigator.pop(context);
                      },
                      child: iconBottomSheet(
                          context, Icons.photo, Colors.blue, 'Galería')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget iconBottomSheet(
      BuildContext context, IconData icon, Color color, String option) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 29,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          option,
          style: const TextStyle(color: Colors.blue, fontSize: 13),
        )
      ],
    );
  }

  /*void platformVerify() {
    var platformName = '';
    if (kIsWeb) {
      platformName = "Web";
    } else {
      if (Platform.isAndroid) {
        platformName = "Android";
      } else if (Platform.isIOS) {
        platformName = "IOS";
      } else if (Platform.isFuchsia) {
        platformName = "Fuchsia";
      } else if (Platform.isLinux) {
        platformName = "Linux";
      } else if (Platform.isMacOS) {
        platformName = "MacOS";
      } else if (Platform.isWindows) {
        platformName = "Windows";
      }
    }
    //print(platformName);
  }*/

  String? getFileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return null;
    }
  }

  Future _selectImage(option) async {
    final dynamic img;
    if (option == 0) {
      img = await ImagePicker().pickImage(source: ImageSource.camera);
    } else {
      img = await ImagePicker().pickImage(source: ImageSource.gallery);
    }

    if (img == null) return;

    setState(() {
      items.add(File(img.path));
      paths.add(img.path);
      print(getFileExtension(img.path));
      print(img.path);
      print(items.length);
      print(paths.length);
    });
  }

  Future _selectVideo() async {
    final dynamic vid;
    vid = await ImagePicker().pickVideo(
        source: ImageSource.camera, maxDuration: const Duration(minutes: 1));

    if (vid == null) return;

    setState(() {
      items.add(File(vid.path));
      print(getFileExtension(vid.path));
      print(vid.path);
      print(items.length);
      generateThumbnail(vid.path);
    });
  }

  void generateThumbnail(path) async {
    String? thumbnailFilePath = await VideoThumbnail.thumbnailFile(
        video: path,
        thumbnailPath: (await getTemporaryDirectory()).path,
        imageFormat: ImageFormat.PNG);
    setState(() {
      paths.add(thumbnailFilePath);
      print(paths.length);
    });
  }

  Widget _gridImageItem(path) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image:
              DecorationImage(image: FileImage(File(path)), fit: BoxFit.cover)),
    );
  }
}

Widget _gridVideoItem(path) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: FileImage(File(path!)), fit: BoxFit.cover)),
      ),
      const CircleAvatar(
        radius: 20,
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.play_arrow,
          size: 30,
          color: Colors.white,
        ),
      ),
    ],
  );
}
