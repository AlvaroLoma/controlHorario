import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:untitled2/src/model/user.dart';
import 'package:untitled2/src/util/Hex.dart';

import 'CambioHora.dart';

class CalendarioTurno extends StatefulWidget {
  User usuario;
  CalendarioTurno(this.usuario, {Key? key}) : super(key: key);

  @override
  State<CalendarioTurno> createState() => _CalendarioTurnoState(usuario);
}

class _CalendarioTurnoState extends State<CalendarioTurno> {
  User usuario;
  num horasTotales=0;
  _CalendarioTurnoState(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambio de Turno'),
        centerTitle: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.lightBlueAccent, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: FutureBuilder(
                  future: usuario.getCalendarioHoras(),
                  builder:
                      (BuildContext context, AsyncSnapshot<Map> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator(),);
                          }
                          else if(snapshot.connectionState == ConnectionState.done) {
                            String tiempo='';
                            List userCalendario = List.of(snapshot.data!['calendario']);
                            List calendario= List.of(snapshot.data!['fichajes']);
                            Map<String,num> horas= Map();
                                calendario.forEach((element) {
                                  if(!horas.containsKey(element['date'])){

                                    horas.addAll({element['date']:element['total_seconds']});
                                  }else{
                                    horas.update(element['date'], (value) =>value+=element['total_seconds']);
                                  }
                                });
                                 return TableCalendar(
                                   startingDayOfWeek: StartingDayOfWeek.monday,
                                   firstDay: DateTime.utc(2015, 10, 16),
                                   lastDay: DateTime.utc(2025, 3, 14),
                                   focusedDay: DateTime.now(),
                                   rowHeight: MediaQuery.of(context).size.height*0.07,
                                   locale:'es_ES',
                                   daysOfWeekStyle: const DaysOfWeekStyle(
                                     weekdayStyle: TextStyle(color: Colors.lightBlue),
                                     // Weekend days color (Sat,Sun)
                                     weekendStyle: TextStyle(color: Colors.lightBlue),
                                   ),
                                   calendarBuilders: CalendarBuilders(
                                     defaultBuilder:  (context, day,day2) {
                                        //element.toString().contains('${day.year}-${day.month<10? '0${day.month}':day.month}-${day.day<10? '0${day.day}':day.day}'

                                       tiempo='0:00';
                                       String fecha ='${day.year}-${day.month<10? '0${day.month}':day.month}-${day.day<10? '0${day.day}':day.day}';
                                       Color? color =getColor2(userCalendario,fecha);
                                       if(horas.containsKey(fecha)){
                                         tiempo =getTiempo(horas[fecha]!);
                                       }
                                       return Center(
                                         child: GestureDetector(
                                           onTap: (){
                                             Navigator.push(
                                               context,
                                               MaterialPageRoute(builder: (context) =>  CambioHora(usuario, fecha)),
                                             );
                                           },
                                           child: Container(
                                             decoration: BoxDecoration(
                                               border: Border.all(
                                                   color: Colors.black26,
                                                   width: 0.5,
                                                   style: BorderStyle.solid
                                               ),
                                               color:color,
                                             ),
                                             width: MediaQuery.of(context).size.width,
                                             height:MediaQuery.of(context).size.height*0.3,
                                             child: Column(
                                               mainAxisAlignment: MainAxisAlignment.center,
                                               children: [
                                                 Text(
                                                   day.day.toString(),
                                                   textAlign: TextAlign.center,
                                                   style: const TextStyle(color: Colors.black),
                                                 ),
                                                 Text(tiempo)
                                               ],
                                             ),
                                           ),
                                         ),
                                       );

                                     },

                                   ),
                                   onDaySelected: (day,day2){
                                     print(day.day);
                                   },

                                 );}
                          return Container();}),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),

            ),
            const Text('Turnos',textAlign: TextAlign.center,style: TextStyle(fontSize: 18),),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(
                thickness:1,
                color: Colors.black26,
              ),
            ),
            const leyendaDias(),
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Divider(
                thickness:1,
                color: Colors.black26,
              ),
            ),
            FutureBuilder(
              future: usuario.getTurnos(),
                builder:  (BuildContext context, AsyncSnapshot<Map> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(),);
              }
              else if (snapshot.connectionState == ConnectionState.done) {
                List turnos= List.of(snapshot.data!['turnos']);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:getTurnos(turnos),
                  ),
                );
              }
              return Container();
            }

            )
          ],
        ),
      ),
    );
  }

  String getTiempo(num s) {
    num horas =0;
    num segundos = s % 60;
    num minutos =s ~/ 60;
    if(minutos>60){
      horas = minutos ~/ 60;
      minutos = minutos  % 60;
    }
   return '${horas>0? horas:''}:${minutos<10? '0$minutos':minutos}';
  }



  Color? getColor2(List userCalendario, String fecha) {
    Color? color = Colors.blue[50];
     for (var value in userCalendario) {
         if(value['fecha']==fecha){
           color = HexColor(value['color']);
           break;
         }
     }
     return color;
  }

  List<Widget> getTurnos(List calendario) {
    List <Widget> lista=[];
    calendario.forEach((element) {

      lista.add(const Padding(padding: EdgeInsets.all(9)),);
      lista.add(
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 11,
              backgroundColor:  HexColor(element['color']),
              child: CircleAvatar(
                radius: 10,
                backgroundColor: HexColor(element['color']),
              ),
            ),
          ],
        )
      );
      lista.add(const Padding(padding: EdgeInsets.all(10)),);
      lista.add(Column(
        children: [
          Text(element['name'])
        ],
      ));
    });
    return lista;
  }
}

class leyendaDias extends StatelessWidget {
  const leyendaDias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.blue[50],
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.green[50],
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Text('Descanso'),
              Padding(padding: EdgeInsets.all(5)),
              Text('Vacaciones')
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.grey,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.grey[50],
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.yellow,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.yellow[50],
                ),
              ),
            ],
          ),
          Column(
            children: const [
              Text('Ausencia'),
              Padding(padding: EdgeInsets.all(5)),
              Text('B. Laboral')
            ],
          ),
          Column(
            children: [
              CircleAvatar(
                radius: 11,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.red[50],
                ),
              ),
              const Padding(padding: EdgeInsets.all(5)),

            ],
          ),
          Column(
            children: const [
              Text('A. Propios'),
              Padding(padding: EdgeInsets.all(5)),

            ],
          )

        ],
      ),
    );
  }
}
