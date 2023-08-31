import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reloj extends StatefulWidget {
  const Reloj({Key? key}) : super(key: key);

  @override
  State<Reloj> createState() => _RelojState();
}

class _RelojState extends State<Reloj> {

  @override

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(seconds: 1)),
      builder: (context, snapshot) {
        DateTime hora=DateTime.now();
        return Text('${hora.hour}:${hora.minute<9? '0${hora.minute}':hora.minute}:${hora.second<10? '0${hora.second}':hora.second}',style: TextStyle(fontSize: 22,color: Colors.white,));
      },
    );
  }


}
