import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
   DetailScreen({super.key,required this.colorCode, required this.parentScreen });
  final Color colorCode;
  final String parentScreen; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorCode,
    appBar: AppBar(),
    body: Center(child: Text(parentScreen, ),),
    );
  }
}