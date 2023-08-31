import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:untitled2/src/pantallas/NuevoGasto.dart';

import '../model/user.dart';
import '../util/Hex.dart';

class Gastos extends StatefulWidget {
  User usuario;
  Gastos(this.usuario,{Key? key}) : super(key: key);

  @override
  State<Gastos> createState() => _GastosState(usuario);
}

class _GastosState extends State<Gastos> {
  User usuario;
  int botonActivo=0;
  bool tipoPago=false;
  _GastosState(this.usuario);
  bool filtroBandera=true;
  String tipoSol='Todos';
  String tipoEstado='Todos';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton.extended(

        icon: const Icon(Icons.add),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NuevoGasto(usuario)),
          );
        }, label: Text('Nuevo'),

      ),
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
                              tipoEstado='Todos';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.080,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.075,
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
                              tipoSol='Trayecto';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.08,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.075,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.drive_eta,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('Trayecto',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Parking';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.08,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.075,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.local_parking,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('Parking',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Hotel';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.08,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.075,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.hotel,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('Hotel',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),

                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Comida';
                            });

                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.08,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.075,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.food_bank,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('Comidas',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              tipoSol='Varios';
                            });
                          },
                          child: CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.08,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.075,
                              backgroundColor: Colors.blue[50],

                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.widgets_outlined,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                                  Text('Varios',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03,color: Colors.lightBlueAccent  ),),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const Padding(padding: EdgeInsets.all(10)),
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
                            tipoPago=true;
                            tipoEstado='Aceptado';
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
                            tipoPago=true;
                            tipoEstado='Pendiente';
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
                            tipoEstado='Rechazado';
                            tipoPago=true;
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
              future: usuario.getGastos(tipoSol,tipoEstado),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
                }
                else if(snapshot.connectionState == ConnectionState.done  && snapshot.hasData){
                  Map mapa= snapshot.data as Map;
                  if(mapa.values.last.length==0){
                    return const Text('No existen solicitudes de este tipo');
                  }
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
                                  color:getEstadoColor(mapa.values.last[index]['estado']),
                                  child: const Text(''),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(width:MediaQuery.of(context).size.width,padding: const EdgeInsets.fromLTRB(5, 1, 1, 0),child: Text('Fecha: ${getFecha(mapa.values.last[index]['fecha'])}',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03, color: Colors.black ), textAlign: TextAlign.start,)),
                                       const Padding(
                                         padding: EdgeInsets.fromLTRB(5,0, 0, 3),
                                         child: Divider(
                                          thickness:2,
                                          color: Colors.grey,
                                      ),
                                       ),
                                      Container(width:MediaQuery.of(context).size.width,padding: const EdgeInsets.fromLTRB(5, 1, 1, 1),child: Text('Cantidad: ${mapa.values.last[index]['cantidad']} €',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03, color: Colors.black ),)),
                                      getPago(mapa.values.last[index]['pago']),
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
                         /* ListTile(
                            dense: true,
                            visualDensity: VisualDensity(vertical: 4),
                            contentPadding: EdgeInsets.all(15),
                            tileColor: Colors.blue[50],
                            shape: RoundedRectangleBorder( //<-- SEE HERE
                              side: BorderSide(width: 3,color: Colors.lightBlueAccent),
                              borderRadius: BorderRadius.circular(20),

                            ),
                            leading:getTipo(mapa.values.last[index]['tipo']),
                            title: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.lightBlueAccent,
                                      width: 2.0,
                                    ),
                                  )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Solicitud de ${mapa.values.last[index]['tipo']}",style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                                  Padding(padding: EdgeInsets.all(5)),
                                  getEstado(mapa.values.last[index]['estado'])
                                ],
                              ),
                            ),
                            trailing: Column(

                              children: [
                                Text('${mapa.values.last[index]['cantidad']} €',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.04, color: Colors.black ),),

                                getPago(mapa.values.last[index]['pago']),


                              ],
                            ),
                          ),*/
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
    if(tipo=='Trayecto'){
      color= Colors.blueGrey[300];
      icon =Icon(Icons.drive_eta,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);
    }
    else if(tipo=='Comida'){
      color= Colors.redAccent[100];
      icon =Icon(Icons.food_bank,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);

    }
    else if(tipo=='Hotel'){
      color= Colors.lightGreen;
      icon =Icon(Icons.hotel,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);
    }
    else if(tipo=='Parking'){
      color= Colors.blueAccent;
      icon =Icon(Icons.local_parking,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);

    }
    else if(tipo=='Varios'){
      color= Colors.pinkAccent;
      icon =Icon(Icons.widgets_outlined,color: Colors.white,size: MediaQuery.of(context).size.width*0.08,);

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
  Widget getEstado(String estado){
    Color? color= Colors.deepPurple[100];
    if(estado=='Aceptado'){
      color=Colors.lightGreen;
    }
    else if(estado=='Rechazado'){
      color=Colors.redAccent;
    }
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: color,
      ),
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
      child: Text('${estado}',style: const TextStyle(color: Colors.black),),
    );
  }
  getFecha(String fecha) {
    String completa = fecha.split(' ')[0];
    return "${completa.split('-')[2]} de ${getMes(completa.split('-')[1])} del ${completa.split('-')[0]}";
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
  getEstadoColor(String estado) {
    if(estado=='Aceptado'){
      return Colors.lightGreen;
    }
    else if(estado=='Pendiente'){
      return Colors.yellow[100];
    }else{
      return Colors.redAccent;
    }
  }
}
