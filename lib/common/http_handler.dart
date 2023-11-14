import 'dart:async';
import 'dart:convert';
import 'package:act3_6/common/constants.dart';
import 'package:act3_6/model/media.dart';
import 'package:http/http.dart' as http;


// import 'package:http/retry.dart';

class HttpHandler {
  final String _baseUrl = 'api.themoviedb.org';
  final String _lenguaje = "es-Es";

  Future<dynamic> getJson(Uri uri) async {
    try {
      http.Response response = (await http.get(uri));
      return json.decode(response.body);
    } finally {
      
    }
  }

  Future<List<Media>> fetchMovies(){
    var uri = Uri.https(_baseUrl, '3/movie/popular', {
        'api_key' : apiKey,
        'page' : "1",
        'language' : _lenguaje
      });
    
    return getJson(uri).then((data) => 
      data["results"].map<Media>((item)=> Media(item)).toList()
    );
  }
}
