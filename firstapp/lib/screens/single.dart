import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SingleScreen extends StatefulWidget {
  final String id;
  SingleScreen(this.id);

  @override
  State<SingleScreen> createState() => _SingleScreenState();
}

class _SingleScreenState extends State<SingleScreen> {
  final dio = Dio();
  dynamic blog = {};
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getData(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Profile")),
        backgroundColor: Color.fromARGB(231, 0, 68, 255),
        foregroundColor: Colors.white,
      ),
      body: isLoading
          ? Text("Loading")
          : Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  children: [
                    Image(
                      image: NetworkImage(blog['avatar']),
                      height: 250,
                      width: 250,
                    ),
                    Text(blog['name']),
                    Text(blog['description'])
                  ],
                ),
              ),
            ),
    );
  }

  void getData(String id) async {
    var response =
        await dio.get('https://65d8a84dc96fbb24c1bc0a15.mockapi.io/api/${id}');
    if (response.statusCode == 200) {
      setState(() {
        blog = response.data;
        isLoading = false;
      });
    }
  }
}
