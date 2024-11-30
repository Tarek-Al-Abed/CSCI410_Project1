import 'package:flutter/material.dart';
import 'home.dart';
void main(){
  runApp(const CallCostApp());
}

class CallCostApp extends StatelessWidget {
  const CallCostApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telephone Call Price',
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}