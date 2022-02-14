import 'package:flutter/material.dart';
import 'package:merge_stream/main_page.dart';

class MergeStreamApp extends StatelessWidget {
  const MergeStreamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
