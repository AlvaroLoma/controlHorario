import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CambioHora.dart';

class CalendarioListado extends StatefulWidget {
  const CalendarioListado({Key? key}) : super(key: key);

  @override
  State<CalendarioListado> createState() => _CalendarioListadoState();
}

class _CalendarioListadoState extends State<CalendarioListado> {
 
  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      padding:  const EdgeInsets.all(10.0),
      itemCount:30,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){

          },
          child: Container(
            height:100,
            child: Card(
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                elevation: 0,
                child: Row(
                  children: [
                    Container(
                      margin:EdgeInsets.fromLTRB(0, 0, 10, 0),
                      height: 100,
                      width: 20,
                      color: Colors.red,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('1 Enero 2023', style: TextStyle(fontSize: 20),),
                        Text('Horario: 08:00-13:00 / 15:00-18:00', style: TextStyle(fontSize: 15),),
                        Text('Trabajado: 08:00-13:00 / 15:00-18:00', style: TextStyle(fontSize: 15),),
                      ],
                    )
          
                  ],
                )
            ),
          ),
        );
      },
    );
  }
}
