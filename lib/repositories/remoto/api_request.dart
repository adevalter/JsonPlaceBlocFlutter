import 'dart:convert';

import 'package:grupoestudo/entities/Post.dart';
import 'package:http/http.dart' as http;

class ApiRequest {
  Future<List<Post>> getPost() async {
    var url = Uri.https('jsonplaceholder.typicode.com', 'posts');
    List<Post> posts = [];
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final decode = json.decode(response.body);
      // return decode.map((json) => Post.fromJson(json));
      for (var json in decode) {
        Post post = Post.fromJson(json);
        posts.add(post);
      }
      return posts;
    } else {
      return <Post>[];
    }
  }
}
