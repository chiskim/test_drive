import 'package:flutter/material.dart';
import 'package:test_drive/screens/settings.dart';

class MyInvestments extends StatelessWidget {
  const MyInvestments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:AppBar(
      title:const Text('Investments'),
      ),
      body:Center(
        child: ElevatedButton(
          child: const Text('Open'),
          onPressed: (){
          //navigate to accounts data when tapped
          Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const MySettings()),
  );
          },
        )
      ) ,
    );
  }
}