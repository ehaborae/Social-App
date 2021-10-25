import 'package:flutter/material.dart';

class NewPost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'New Post',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
