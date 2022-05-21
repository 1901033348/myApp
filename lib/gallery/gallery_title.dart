import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'completes/gallery_complete.dart';
import 'completes/gallery_title_complete.dart';

class GalleryTitle extends StatefulWidget {
  final GalleryComplete galleryTitle;
  const GalleryTitle({Key? key, required this.galleryTitle}) : super(key: key);

  @override
  _GalleryTitleState createState() => _GalleryTitleState();
}

class _GalleryTitleState extends State<GalleryTitle> {
  List<GalleryTitleComplete> dataPhotos = <GalleryTitleComplete>[];

  Future<List<GalleryTitleComplete>> fetchData() async {
    var url =
        'https://jsonplaceholder.typicode.com/photos/?albumId=${widget.galleryTitle.id}';
    var response = await get(Uri.parse(url));
    var data = <GalleryTitleComplete>[];
    if (response.statusCode == 200) {
      var datasJson = json.decode(response.body);
      for (var dataJson in datasJson) {
        data.add(GalleryTitleComplete.fromJson(dataJson));
      }
    }
    return data;
  }

  @override
  void initState() {
    fetchData().then((value) {
      setState(() {
        dataPhotos.addAll(value);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const color1 = const Color(0xff231D49);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Title',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.15,
          ),
        ),
        centerTitle: true,
        backgroundColor: color1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
        ),
      ),
      body: OverflowBox(
        maxWidth: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: (dataPhotos.length.toDouble() / 3).toInt(),
          itemBuilder: (context, index) {
            int a = 3 * index;
            int b = 3 * index + 1;
            int c = 3 * index + 2;
            return Row(
              children: [
                Container(
                  width: (MediaQuery.of(context).size.width - 40) / 3,
                  height: 120,
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage('${dataPhotos[a].thumbnailUrl}'),
                        fit: BoxFit.cover,
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '${dataPhotos[a].title}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 8,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 40) / 3,
                  height: 120,
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage('${dataPhotos[b].thumbnailUrl}'),
                        fit: BoxFit.cover,
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '${dataPhotos[b].title}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 8,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: (MediaQuery.of(context).size.width - 40) / 3,
                  height: 120,
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage('${dataPhotos[c].thumbnailUrl}'),
                        fit: BoxFit.cover,
                      )),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        '${dataPhotos[c].title}',
                        style: TextStyle(
                          fontSize: 8,
                          letterSpacing: 1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
