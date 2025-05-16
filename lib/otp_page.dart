import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  List<dynamic> paradox = [];

  Future<void> paradoxApi() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/carts'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['carts'] != null && data['carts'] is List) {
        setState(() {
          paradox = data['carts'];
        });
      } else {
        setState(() {
          paradox = [];
        });
      }
    } else {
      print('Failed to load data: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    paradoxApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OTP Page',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        actions: const [
          Icon(Icons.three_k_plus, size: 40, color: Colors.white),
        ],
      ),
      body: paradox.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: paradox.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text("Cart ID: ${paradox[index]['id']}"),
                    subtitle: Text("Total Price: \$${paradox[index]['total']}"),
                    trailing:  Text("quantity Price: \$${paradox[index]['quantity']}")
                  ),
                );
              },
            ),
    );
  }
}
