import 'dart:convert';

import 'package:grupoestudo/entities/posts.dart';
import 'package:http/http.dart' as http;

class ApiRequestPost {
  Future<List<Posts>> getPost(int page, int maxResults) async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts',
        {'_page': '$page', '_limit': '$maxResults'});

    var response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> decoded = json.decode(response.body);
      return decoded.map((json) => Posts.fromJson(json)).toList();
    } else {
      return <Posts>[];
    }
  }
}
