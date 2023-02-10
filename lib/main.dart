import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thence/blocs/tree_bloc.dart';
import 'package:thence/repos/apiProvider.dart';
import 'package:thence/screens/details.dart';
import 'package:thence/screens/home.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),

    );
  }

}
