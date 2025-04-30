import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Get extends StatefulWidget {
  const Get({super.key});

  @override
  State<Get> createState() => _GetState();
}

class _GetState extends State<Get> {
  List abhi = [];

  Future<List> abhiApi() async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    if (response.statusCode == 200) {
      abhi = jsonDecode(response.body);
      return abhi;
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('PHOTO API',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),backgroundColor: Colors.blue,
      ),
    
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder(
              future: abhiApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(child: Text("Error loading data"));
                } else {
                  return ListView.builder(
                    itemCount: abhi.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(abhi[index]["id"].toString()),
                              Text(abhi[index]["title"]),
                        
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Image.network(
                                  abhi[index]["url"],
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.network("https://picsum.photos/200");
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),
                              Image.network(
                                abhi[index]["thumbnailUrl"],
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.network("https://picsum.photos/100");
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
