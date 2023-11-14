import 'package:flutter/material.dart';
import 'package:act3_6/common/http_handler.dart';
import 'package:act3_6/model/media.dart';



class MediaList extends StatefulWidget {
  const MediaList({super.key});
  
  @override
  State<MediaList> createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  final List<Media> _media = <Media>[];

  @override
  void initState(){
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    var movies = await HttpHandler().fetchMovies();
    setState(() {
      _media.addAll(movies); 
    });
    print ("total =  ${_media.length}" );
  }

  @override
  Widget build(BuildContext context) {
    return Container (
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Column(
              children: <Widget>[
                Image.network(_media[index].getPosterUrl())
              ],
          );
        },
        itemCount: _media.length,

      ),
    );
  }
}