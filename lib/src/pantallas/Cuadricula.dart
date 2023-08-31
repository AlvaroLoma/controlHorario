import 'dart:io';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class Cuadricula extends StatefulWidget {
  Map data;
  Cuadricula(this.data);

  @override
  State<StatefulWidget> createState() {
    return _CuadriculaState(this.data);
  }
}

class _CuadriculaState extends State<Cuadricula> {
  Color color= Colors.white;
  Map data;
  _CuadriculaState(this.data);
  @override
  Widget build(BuildContext context) {
    return  TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: DateTime.now(),
        locale:'es_ES',
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.lightBlue),
          // Weekend days color (Sat,Sun)
          weekendStyle: TextStyle(color: Colors.lightBlue),
        ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder:  (context, day,day2) {
          List calendario= List.of(data['calendario']);
          calendario.forEach((element) {
              if(element.toString().contains('${day.year}-${day.month<10? '0${day.month}':day.month}-${day.day<10? '0${day.day}':day.day}')){
                   if(element.toString().contains('Laboral')){
                      color= Colors.grey[300]!;
                   }
                   else if(element.toString().contains('Descanso')){
                     color= Colors.blue[50]!;
                   }
                   else if(element.toString().contains('Vacaciones')){
                     color= Colors.green[50]!;
                   }
                   else if(element.toString().contains('Ausencia')){
                     color=  Colors.grey[50]!;
                   }
                   else if(element.toString().contains('Baja Laboral')){
                     color= Colors.yellow[50]!;
                   }
                   else if(element.toString().contains('Asuntos Propios')){
                     color=  Colors.red[50]!;
                   }
              }
          });

          return Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.black,
                    width: 1.0,
                    style: BorderStyle.solid
                ),
                color: color,
              ),
              width: MediaQuery.of(context).size.width,
              height:MediaQuery.of(context).size.height ,
              child: Text(
                day.day.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black),
              ),
            ),
          );

        },

      ),

    );

  }


}

