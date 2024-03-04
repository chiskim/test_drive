import 'package:flutter/material.dart';

class MyRecords extends StatelessWidget {
  const MyRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
      title:const Text('Records')
      
     ),
     body: const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        //child: const ElevatedButton(onPressed: onPressed, child: child)
      ],
     )
    );
  }
}