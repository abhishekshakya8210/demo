import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Photo extends StatefulWidget {
  const Photo({super.key});

  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  List photo = [];

  Future<void> photoapi() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      photo = jsonDecode(response.body);
      setState(() {});
    } else {
    
    }
  }

  @override
  void initState() {
    super.initState();
    photoapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'photo api',
          style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: true,
      ),
      body: photo.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: photo.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(photo[index]['userId'].toString()),
                      Text(photo[index]['id'].toString()),
                         Text(photo[index]['title']),
                         Text(photo[index]['body']),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
