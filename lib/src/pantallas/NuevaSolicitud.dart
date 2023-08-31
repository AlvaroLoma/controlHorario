

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';


import '../login.dart';
import '../model/user.dart';
import '../util/Hex.dart';

class NuevaSolicitud extends StatefulWidget {
  User usuario;
   NuevaSolicitud(this.usuario,{Key? key}) : super(key: key);

  @override
  State<NuevaSolicitud> createState() => _NuevaSolicitudState(usuario);
}

class _NuevaSolicitudState extends State<NuevaSolicitud>  with SingleTickerProviderStateMixin{
  User usuario;
  late TabController _controller;

  List<Widget> list = [
    const Tab(
      text: 'Tipo de Solicitud',
      icon: Icon(Icons.bookmark),
    ),
    const Tab(
      text: 'Datos',
      icon: Icon(Icons.info),
    ),
  ];
  String tipoSol = 'Trayecto';
  bool tipoPago = false;
  String selectedTurno='';
  List<DateTime?> _dates=[];
  int turnoSelected=0;
  _NuevaSolicitudState(this.usuario);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: list.length, vsync: this);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: const Text('Nueva Solicitud'),
        bottom: TabBar(
          controller: _controller,
          tabs: list,
        ),
      ),
      body: TabBarView(
        controller: _controller,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Nueva Solicitud',textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.06, letterSpacing: 1.6,fontWeight: FontWeight.w200),),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                  child: Divider(
                    thickness:1,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                const Padding(padding: EdgeInsets.all(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tipoSol = 'Vacaciones';
                          _controller.index = 1;
                        });
                      },
                      child: Card(
                        child:Padding(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          child: Center(child:
                          Column(
                            children: [
                              CircleAvatar(
                                radius: MediaQuery.of(context).size.width * 0.08,
                                backgroundColor: Colors.lightBlueAccent,
                                child: CircleAvatar(
                                  radius: MediaQuery.of(context).size.width * 0.075,
                                  backgroundColor: Colors.blue[50],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.beach_access,
                                          size:
                                          MediaQuery.of(context).size.width * 0.10,
                                          color: Colors.lightBlueAccent),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(5)),
                              Text(
                                'Vacaciones',
                                style: TextStyle(
                                    fontSize:
                                    MediaQuery.of(context).size.width *
                                        0.04,
                                    color: Colors.lightBlueAccent),
                              ),
                            ],
                          ),),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tipoSol = 'Ausencia';
                          _controller.index = 1;
                        });
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          child: Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.width * 0.08,
                                  backgroundColor: Colors.lightBlueAccent,
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width * 0.075,
                                    backgroundColor: Colors.blue[50],
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.directions_run_sharp,
                                            size:
                                            MediaQuery.of(context).size.width * 0.10,
                                            color: Colors.lightBlueAccent),
                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'Ausencia',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.04,
                                      color: Colors.lightBlueAccent),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),)
                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tipoSol = 'Asuntos Propios';
                          _controller.index = 1;
                        });
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          child: Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.width * 0.08,
                                  backgroundColor: Colors.lightBlueAccent,
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width * 0.075,
                                    backgroundColor: Colors.blue[50],
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.weekend,
                                            size:
                                            MediaQuery.of(context).size.width * 0.10,
                                            color: Colors.lightBlueAccent),

                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'A. Propios',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.04,
                                      color: Colors.lightBlueAccent),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          tipoSol = 'Descanso';
                          _controller.index = 1;
                        });
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          child: Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.width * 0.08,
                                  backgroundColor: Colors.lightBlueAccent,
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width * 0.075,
                                    backgroundColor: Colors.blue[50],
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.hotel,
                                            size:
                                            MediaQuery.of(context).size.width * 0.10,
                                            color: Colors.lightBlueAccent),

                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'Descanso',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.04,
                                      color: Colors.lightBlueAccent),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                const Padding(padding: EdgeInsets.all(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        tipoSol = 'Cambio Turno';
                        _controller.index = 1;
                        setState(() {});
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          child: Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.width * 0.08,
                                  backgroundColor: Colors.lightBlueAccent,
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width * 0.075,
                                    backgroundColor: Colors.blue[50],
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.access_time_filled,
                                            size:
                                            MediaQuery.of(context).size.width * 0.10,
                                            color: Colors.lightBlueAccent),

                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'C. Turno',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.04,
                                      color: Colors.lightBlueAccent),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        tipoSol = 'Baja Laboral';
                        _controller.index = 1;
                        setState(() {});
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),
                          child: Center(
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: MediaQuery.of(context).size.width * 0.08,
                                  backgroundColor: Colors.lightBlueAccent,
                                  child: CircleAvatar(
                                    radius: MediaQuery.of(context).size.width * 0.075,
                                    backgroundColor: Colors.blue[50],
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.healing,
                                            size:
                                            MediaQuery.of(context).size.width * 0.10,
                                            color: Colors.lightBlueAccent),

                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'B. Laboral',
                                  style: TextStyle(
                                      fontSize:
                                      MediaQuery.of(context).size.width *
                                          0.04,
                                      color: Colors.lightBlueAccent),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(

                    width: MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height*0.40,
                    child: CalendarDatePicker2(
                      config: CalendarDatePicker2Config(
                        calendarType: CalendarDatePicker2Type.range,
                      ),
                      value: _dates,
                      onValueChanged: (dates) {_dates = dates;
                        setState(() {

                        });},
                    ),
                  ),
                ],
              ),

              _dates.length>1? Container(child: Text('Rango de fechas: ${mostrarFechas(_dates)}')):Container(child: const Text('')),

              tipoSol=='Cambio Turno'?  FutureBuilder(
                  future: usuario.getTurnosAll(),
                  builder:  (BuildContext context, AsyncSnapshot<Map> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    else if (snapshot.connectionState == ConnectionState.done) {
                      List turnos= List.of(snapshot.data!['turnos']);

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text('Turnos: '),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                              child: Divider(
                                thickness:1,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            Wrap(
                              children:getTurnos(turnos),
                            ),
                          ],
                        ),
                      );
                    }
                    return Container();
                  }

              ):Container(),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 50),
                child: ButtonWidget(
                  onClick: () async {
                      usuario.sendSolicitud(tipoSol,_dates,turnoSelected);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Solicitud de Gasto enviada'),
                      ));
                      Navigator.pop(context);
                  },
                  btnText: "Enviar",
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  List<Widget> getTurnos(List calendario) {
    List <Widget> lista=[];

    calendario.forEach((element) {
      lista.add(
          GestureDetector(
            onTap: (){
              selectedTurno=element['name'];
              turnoSelected=element['id'];
              setState(() {

              });
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(0, 5, 5, 0),

              color: selectedTurno==element['name']?  HexColor(element['color']):Colors.white,
              padding: EdgeInsets.all(15),
             child: Text(element['name']),
            ),
          )
      );
    });
    return lista;
  }
  mostrarFechas(List<DateTime?> dates) {
    String cadena='';
    dates.forEach((element) {
      if(element!=null){
        cadena +=' '+element.toString().split(" ")[0]+' ';
      }
    });
    return cadena;
  }

}
