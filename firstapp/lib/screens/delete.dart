import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Delete extends StatefulWidget {
  final blog;
  Delete(this.blog);

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Delete Modal'),
      content: Text('Do you want to delete ${widget.blog['name']}?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              getData(widget.blog['id']);
            },
            child: Text('delete')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('cancel'))
      ],
    );
  }

  void getData(String id) async {
    var response = await dio
        .delete('https://65d8a84dc96fbb24c1bc0a15.mockapi.io/api/${id}');
    if (response.statusCode == 200) {
      Navigator.pop(context, true);
    }
  }
}
