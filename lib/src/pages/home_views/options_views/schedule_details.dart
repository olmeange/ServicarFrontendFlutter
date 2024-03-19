import 'package:flutter/material.dart';
import 'package:servicarmt/src/pages/home_views/options_views/schedule_gridview_video.dart';
import 'package:servicarmt/src/pages/home_views/options_views/schedule_gridview_image.dart';

class ScheduleDetails extends StatelessWidget {
  const ScheduleDetails({super.key, required this.item});
  final dynamic item;
  final String imgUrl = 'http://192.168.100.14:5000/api/image/';
  final String thumbnailUrl = 'http://192.168.100.14:5000/api/thumbnail/';
  final String vidUrl = 'http://192.168.100.14:5000/api/video/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Detalles del Agendamiento',
          style: TextStyle(color: Colors.white),
        ),
        leading: const BackButton(color: Colors.white),
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
                Text('Fecha de creación:  ${item['date']}'),
                Text('id: ${item['id']}'),
                const SizedBox(height: 20.0),
                SizedBox(
                    height: 400,
                    child: GridView.builder(
                        itemCount:
                            item['images'].length + item['videos'].length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => item['images']
                                                    .length >
                                                index
                                            ? ScheduleGridviewImage(
                                                item:
                                                    "${imgUrl + item['images'][index]}.jpg")
                                            : ScheduleGridviewVideo(
                                                item:
                                                    "${vidUrl + item['videos'][index - 1 - item['videos'].length]}.mp4")));
                              },
                              child: _gridItem(index, item['images'].length,
                                  item['videos'].length));
                        }))
              ]),
        ),
      )),
    );
  }

  Widget _gridItem(index, imgLength, thumbnailLength) {
    return imgLength > index
        ? Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image:
                        NetworkImage("${imgUrl + item['images'][index]}.jpg"),
                    fit: BoxFit.cover)),
          )
        : Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(
                            "${thumbnailUrl + item['videos'][index - imgLength]}.jpg"),
                        fit: BoxFit.cover)),
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
}
