import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'package:untitled2/src/model/user.dart';

class CambioHora extends StatefulWidget {
  User usuario;
  String fecha;
  CambioHora(this.usuario, this.fecha, {Key? key}) : super(key: key);

  @override
  State<CambioHora> createState() => _CambioHoraState(usuario, fecha);
}

class _CambioHoraState extends State<CambioHora> {

  //text editing controller for text field
  Map<int,String> horasEntradas={};
  Map<int,String> horasSalida={};

  User usuario;
  String fecha;
  _CambioHoraState(this.usuario,this.fecha);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getDiaEntrada(fecha)),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.lightBlueAccent, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: usuario.getFichajeDia(fecha),
                  builder:  (BuildContext context, AsyncSnapshot<Map> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    else if (snapshot.connectionState == ConnectionState.done) {

                        if(snapshot.data!=null){
                          List fichaje = snapshot.data!['fichajes'];

                          return Column(
                            children: getFichajesAll(fichaje) ,
                          );

                        }

                    }
                    return Container();
                  }
              ),
              Card(
                  margin: const EdgeInsets.all(30),
                  color: Colors.grey[200],
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: TextField(
                      maxLines: 8, //or null
                      decoration:
                          InputDecoration.collapsed(hintText: "Observaciones"),
                    ),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.lightBlueAccent)),
                    onPressed: null,
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          'Cerrar',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateColor.resolveWith(
                            (states) => Colors.lightBlueAccent)),
                    onPressed: (){
                      mandarSolicitud();
                    },
                    child: const Padding(
                        padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                        child: Text(
                          'Aceptar',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              )
            ],
        ),
      ),
    );
  }

  getFichajesAll(List fichaje) {
    List<Widget> elementos=[];
    num contador =1;
    fichaje.forEach((element) {
      if(!horasEntradas.containsKey(element['id'])){
        horasEntradas.addAll({element['id']:'00:00'});
      }
      if(!horasSalida.containsKey(element['id'])){
        horasSalida.addAll({element['id']:'00:00'});
      }

      elementos.add( Row( children:  [Padding(padding: const EdgeInsets.fromLTRB(15, 20, 15, 0), child: Text('Tramo $contador',style: const TextStyle(fontSize: 14),)),],mainAxisAlignment: MainAxisAlignment.center,),);
      elementos.add( const Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Divider(
          thickness:1,
          color: Colors.black26,
        ),
      ),);
      elementos.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Padding(padding:EdgeInsets.all(5.0)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.play_arrow,
                    size: MediaQuery.of(context).size.width * 0.08,
                    color: Colors.lightGreen,
                  ),
                ),
                const Padding(padding:EdgeInsets.all(5.0)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    getDiaEntrada(element['check_in']),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Padding(padding:EdgeInsets.all(10.0)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    getHoraEntrada(element['check_in']),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Padding(padding:EdgeInsets.all(5.0)),
                Icon(
                  Icons.compare_arrows,
                  size: MediaQuery.of(context).size.width * 0.11,
                  color: Colors.lightGreen,
                ),
                TextButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime =  await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                      if(pickedTime != null ){
                          //output 10:51 PM
                        horasEntradas.update(element['id'], (value) =>value='${pickedTime.hour}:${pickedTime.minute<10? '0${pickedTime.minute}':pickedTime.minute}');
                        setState(() {});
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[350],
                      ),
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        horasEntradas[element['id']].toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    )),


              ],
            ),
          )
      );
      elementos.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const Padding(padding:EdgeInsets.all(5.0)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(5.0),
                  child: Icon(
                    Icons.stop,
                    size: MediaQuery.of(context).size.width * 0.08,
                    color: Colors.redAccent,
                  ),
                ),
                const Padding(padding:EdgeInsets.all(5.0)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    getDiaEntrada(element['check_out']),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Padding(padding:EdgeInsets.all(10.0)),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.grey[200],
                  ),
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    getHoraEntrada(element['check_out']),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
                const Padding(padding:EdgeInsets.all(5.0)),
                Icon(
                  Icons.compare_arrows,
                  size: MediaQuery.of(context).size.width * 0.11,
                  color: Colors.redAccent,
                ),
                TextButton(
                    onPressed: () async {
                      TimeOfDay? pickedTime =  await showTimePicker(
                        initialTime: TimeOfDay.now(),
                        context: context,
                      );
                      if(pickedTime != null ){
                        print(pickedTime.hour);
                        //output 10:51 PM
                        horasSalida.update(element['id'], (value) =>value='${pickedTime.hour}:${pickedTime.minute<10? '0${pickedTime.minute}':pickedTime.minute}');
                        setState(() {});//output 10:51 PM

                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey[350],
                      ),
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        horasSalida[element['id']].toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    )),

              ],
            ),
          )
      );
      contador++;
    });
    return elementos;
  }

  String getDiaEntrada(element) {
    List fecha = element.split(' ')[0].split('-');
    return '${fecha[2]}-${fecha[1]}-${fecha[0]}';
  }

  String getHoraEntrada(element) {
    return element.split(' ')[1];
  }

  void mandarSolicitud() {

    usuario.mandarSolicitudes(horasEntradas,horasSalida);
  }
}
