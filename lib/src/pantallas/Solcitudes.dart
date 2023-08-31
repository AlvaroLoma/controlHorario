import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';
import 'NuevaSolicitud.dart';

class Solicitudes extends StatefulWidget {
  User user;
   Solicitudes(this.user,{Key? key}) : super(key: key);

  @override
  State<Solicitudes> createState() => _SolicitudesState(this.user);
}

class _SolicitudesState extends State<Solicitudes> {
  User usuario;
  int botonActivo=0;
  _SolicitudesState(this.usuario);
  bool filtroBandera=true;
  String tipoSol='Todos';
  String tipoEstado='0';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  NuevaSolicitud(usuario)),
       );
      },icon: const Icon(Icons.add), label: Text('Nuevo'),),
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
        title: const Text('Solicitudes'),
        actions: [
          IconButton(onPressed: (){
            setState(() {
              filtroBandera==true? filtroBandera=false:filtroBandera=true;
            });
          }, icon: const Icon(Icons.filter_alt), color: Colors.white,)
        ],
      ),
      body: Column(
        children: [
          Visibility(
            visible: filtroBandera,
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.white,
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(padding: EdgeInsets.all(5)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Todos';
                              tipoEstado='0';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.090,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.085,
                              backgroundColor: Colors.blue[50],
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.apps,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent,),
                                  Text('Todos',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent ),),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Vacaciones';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.09,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.085,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.beach_access,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('Vacaciones',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Ausencia';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.09,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.085,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.directions_run_sharp,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('Ausencia',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Asuntos Propios';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.09,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.085,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.weekend,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('A. Propios',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Descanso';
                            });

                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.09,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.085,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.hotel,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('Descanso',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Cambio Turno';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.09,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.085,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.access_time_filled,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('C. Turno',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Baja Laboral';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.09,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.085,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.healing,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('B. Laboral',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
                    child: Divider(
                      thickness:2,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){

                          setState(() {

                            tipoEstado='3';
                            botonActivo=1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightBlueAccent),
                            borderRadius: BorderRadius.circular(5),
                            color: botonActivo==1? Colors.lightBlueAccent:Colors.white,
                          ),
                          padding: const EdgeInsets.fromLTRB(10,5, 10, 5),

                          width: MediaQuery.of(context).size.width*0.30,
                          child: const Text('Aceptadas',textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      GestureDetector(
                        onTap: (){

                          setState(() {

                            tipoEstado='1';
                            botonActivo=2;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightBlueAccent!),
                            borderRadius: BorderRadius.circular(5),
                            color: botonActivo==2? Colors.lightBlueAccent:Colors.white,
                          ),
                          padding: const EdgeInsets.fromLTRB(10,5, 10, 5),


                          width: MediaQuery.of(context).size.width*0.30,
                          child: const Text('Solicitado',textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            tipoEstado='2';
                            botonActivo=3;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.lightBlueAccent),
                            borderRadius: BorderRadius.circular(5),
                            color: botonActivo==3? Colors.lightBlueAccent:Colors.white,
                          ),
                          padding: const EdgeInsets.fromLTRB(10,5, 10, 5),
                          width: MediaQuery.of(context).size.width*0.30,
                          child: const Text('Rechazados',textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 20, 12, 5),
            child: FutureBuilder(
              future: usuario.getSolicitudes(tipoSol,tipoEstado),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                else if(snapshot.connectionState == ConnectionState.done && snapshot.hasData){

                  Map mapa= snapshot.data as Map;

                  if(mapa.values.last.length==0){
                    return const Text('No existen solicitudes de este tipo');
                  }
                  print(mapa);
                  return ListView.separated(
                    itemCount:mapa.values.last.length,
                    separatorBuilder: (context, index) {
                      return const Padding(padding: EdgeInsets.all(10.0),);
                    },
                    itemBuilder: (context, index) {
                      return  Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color:Colors.blue[50],
                                border: Border.all(color: Colors.lightBlueAccent,width: 2)
                            ),

                            child: Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*0.04,
                                  height: MediaQuery.of(context).size.height*0.12,
                                  color:getEstadoColor(mapa.values.last[index]['estado_id']),
                                  child: const Text(''),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(width:MediaQuery.of(context).size.width,padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),
                                          child: Text('Fecha: ${getFecha(mapa.values.last[index]['fechaPeticion'])}',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03, color: Colors.black ), textAlign: TextAlign.start,)),
                                      const Padding(
                                        padding: EdgeInsets.fromLTRB(5,0, 0, 3),
                                        child: Divider(
                                          thickness:2,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Container(width:MediaQuery.of(context).size.width,padding: const EdgeInsets.fromLTRB(5, 1, 1, 1),
                                          child: Text('Tipo: ${mapa.values.last[index]['tipo']} ',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03, color: Colors.black ),)),
                                      Container(width:MediaQuery.of(context).size.width,padding: const EdgeInsets.fromLTRB(5, 1, 1, 1),
                                          child: Text('Inicio: ${getFormato(mapa.values.last[index]['inicio'])} Fin: ${getFormato(mapa.values.last[index]['fin'])}',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03, color: Colors.black ),)),

                                    ],
                                  ),
                                ),
                               Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: getTipo(mapa.values.last[index]['tipo']),
                                )
                              ],
                            ),
                          ),

                        ],
                      );
                    },
                  );
                }

                return  const Text('No existen solicitudes de este tipo');
              },
            ),
          ),),
          Padding(padding: EdgeInsets.all(40))
        ],
      ),
    );
  }
  Widget getTipo(String tipo){
    Color? color= Colors.lightBlueAccent;
    Widget icon =Icon(Icons.drive_eta,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);
    if(tipo=='Vacaciones'){
      color= Colors.yellow;
      icon =Icon(Icons.beach_access,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);
    }
    else if(tipo=='Ausencia'){
      color= Colors.pinkAccent;
      icon =Icon(Icons.directions_run_sharp,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);
    }
    else if(tipo=='Asuntos Propios'){
      color= Colors.brown;
      icon =Icon(Icons.weekend,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);
    }
    else if(tipo=='Descanso'){
      color= Colors.blue;
      icon =Icon(Icons.hotel,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);
    }
    else if(tipo=='Baja Laboral'){
      color= Colors.redAccent;
      icon =Icon(Icons.healing,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);
    }
    else if(tipo=='Cambio Turno'){
      color= Colors.lightGreen;
      icon =Icon(Icons.access_time_filled,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);
    }
    return Container(

        decoration:   BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: color,
        ),
        padding: const EdgeInsets.all(10),
        child:  icon
    );
  }
  Widget getPago(String pago){

    return  Container(
      width: MediaQuery.of(context).size.width,

      padding: const EdgeInsets.fromLTRB(5, 1, 1, 1),
      child:Text('Forma de Pago: ${pago}',style: const TextStyle(color: Colors.black),),
    );
  }
  Widget getEstado(int estado){
    Color? color= Colors.deepPurple[100];
    if(estado==1){
      color=Colors.lightGreen;
    }
    else if(estado==3){
      color=Colors.redAccent;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: color,
      ),
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Text('uwu',style: const TextStyle(color: Colors.black),),
    );
  }
  getFecha(String fecha) {
    List<String> completa = fecha.split('-');
    return "${completa[0]} de ${getMes(completa[1])} del ${completa[2]}";
  }
  getMes(String mes) {
    if(mes.contains('01')){
      return 'Enero';
    }
    else if(mes.contains('02')){
      return 'Febrero';
    }
    else if(mes.contains('03')){
      return 'Marzo';
    }
    else if(mes.contains('04')){
      return 'Abril';
    }
    else if(mes.contains('05')){
      return 'Mayo';
    }
    else if(mes.contains('06')){
      return 'Junio';
    }
    else   if(mes.contains('07')){
      return 'Julio';
    }
    else if(mes.contains('08')){
      return 'Agosto';
    }
    else if(mes.contains('09')){
      return 'Septiembre';
    }
    else  if(mes.contains('10')){
      return 'Octubre';
    }
    else if(mes.contains('11')){
      return 'Noviembre';
    }
    else if(mes.contains('12')){
      return 'Diciembre';
    }
  }
  getEstadoColor(int estado) {
    if(estado==3){
      return Colors.lightGreen;
    }
    else if(estado==1){
      return Colors.yellow[100];
    }else{
      return Colors.redAccent;
    }
  }

  getFormato(String fecha) {
    List<String> completa = fecha.split('-');
    return "${completa[2]}-${completa[1]}-${completa[0]}";
  }
}
