import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'completes/gallery_complete.dart';
import 'completes/gallery_title_complete.dart';
import 'gallery_title.dart';

class Gallery extends StatefulWidget {
  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<GalleryComplete> dataAlbums = <GalleryComplete>[];

  Future<List<GalleryComplete>> fetchData() async {
    var url = 'https://jsonplaceholder.typicode.com/albums';
    var responce = await get(Uri.parse(url));
    var data = <GalleryComplete>[];
    if (responce.statusCode == 200) {
      var datasJson = json.decode(responce.body);
      for (var dataJson in datasJson) {
        data.add(GalleryComplete.fromJson(dataJson));
      }
    }
    return data;
  }

  List<GalleryTitleComplete> dataPhotos = <GalleryTitleComplete>[];

  Future<List<GalleryTitleComplete>> fetchDataTitle() async {
    var url = 'https://jsonplaceholder.typicode.com/photos}';
    var responce = await get(Uri.parse(url));
    var data = <GalleryTitleComplete>[];
    if (responce.statusCode == 200) {
      var datasJson = json.decode(responce.body);
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
        dataAlbums.addAll(value);
      });
    });
    fetchDataTitle().then((value) {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Gallery',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.15,
            )),
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
            itemCount: (dataAlbums.length.toDouble() / 2).toInt(),
            itemBuilder: (context, index) {
              int a = 2 * index;
              int b = 2 * index + 1;
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        GalleryTitle(galleryTitle: dataAlbums[index]),
                  ));
                },
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 40) / 2,
                      height: 168,
                      margin: EdgeInsets.only(left: 16, top: 8, bottom: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://data.whicdn.com/images/40242139/original.jpg'),
                            fit: BoxFit.cover,
                          )),
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 40) / 2,
                        height: 84,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, bottom: 8),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              dataAlbums[a].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width - 40) / 2,
                      height: 168,
                      margin: EdgeInsets.only(left: 8, top: 8, bottom: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://data.whicdn.com/images/40242139/original.jpg'),
                            fit: BoxFit.cover,
                          )),
                      child: Container(
                        width: (MediaQuery.of(context).size.width - 40) / 2,
                        height: 84,
                        child: Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, bottom: 8),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              dataAlbums[b].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
