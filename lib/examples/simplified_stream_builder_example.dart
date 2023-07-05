import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../src/simplified_builder.dart';

class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class PostListScreen extends StatelessWidget {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/posts';

  const PostListScreen({super.key});

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((item) => Post.fromJson(item)).toList();
    } else {
      throw Exception('Failed to fetch posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post List'),
      ),
      body: Center(
        child: SimplifiedStreamBuilder<List<Post>>(
          stream: Stream.fromFuture(fetchPosts()),
          builder: (data) => ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final post = data[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            },
          ),
          errorBuilder: (error) => Text('Error: $error'),
          loadingWidget: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
