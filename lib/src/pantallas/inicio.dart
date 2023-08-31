import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:untitled2/src/pantallas/documentos.dart';


import '../model/user.dart';
import '../util/Hex.dart';
import '../util/reloj.dart';

import 'CalendarioTurno.dart';
import 'Gastos.dart';
import 'Solcitudes.dart';
import 'chat.dart';

class Principal extends StatefulWidget {
  Principal(this.usuario, {Key? key}) : super(key: key);
  User usuario;
  @override
  State<Principal> createState() => _PrincipalState(this.usuario);
}

class _PrincipalState extends State<Principal> with TickerProviderStateMixin{
   User usuario;
  String hora = "";
  _PrincipalState(this.usuario);
  bool containerFichaje=false;
  bool containerHora=false;

  //boton fichaje
  Color colorFichaje = Colors.lightGreen;
  IconData icon = Icons.play_arrow;
  @override
  void initState() {
    super.initState();

  }
  @override
  void dispose() {
    // TODO: implement dispose

    super.dispose();
  }
   bool clickedCentreFAB = false; //boolean used to handle container animation which expands from the FAB
   int selectedIndex = 0; //to handle which item is currently selected in the bottom app bar
   String text = "Home";
    bool puedeFichar=true;
   //call this method on click of each bottom app bar item to update the screen
   void updateTabSelection(int index, String buttonText) {
     setState(() {
       selectedIndex = index;
       text = buttonText;
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //specify the location of the FAB
      floatingActionButton:  //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      FloatingActionButton.large(
        elevation:4,
        backgroundColor: Colors.white,
        tooltip: 'Fichar',
        onPressed: () async {
          puedeFichar=false;
          setState(() {

          });

          await usuario.fichar().then((value) =>  setState(() { puedeFichar=true;}));
        },
        child:FutureBuilder(
          future: usuario.nextFichaje(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {

             bool ultimo = snapshot.data['status'];
            
              if(!ultimo){
                icon= Icons.stop;
                colorFichaje=Colors.redAccent;
              }else{
                colorFichaje=Colors.lightGreen;
                icon= Icons.play_arrow;
              }
              return Container(
                width:MediaQuery.of(context).size.width * 0.50 ,
                height:MediaQuery.of(context).size.height * 0.50 ,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorFichaje,
                    width: 3,
                  ),
                ),
                child:puedeFichar? Icon(
                  icon,color: colorFichaje,
                ): const CircularProgressIndicator()
              );
            }else{
              return Container();
            }

          },
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.all(15),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.lightBlue),
                    color: Colors.lightBlueAccent,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        obtenerFecha(),
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      const Reloj()
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                child: FutureBuilder(
                  future: usuario.getInfo(), // a previously-obtained Future<String> or null
                  builder: (BuildContext context,
                      AsyncSnapshot<Map> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.connectionState == ConnectionState.done) {

                      Map mapa= snapshot.data as Map;
                      if(mapa.values.last.length<=0){
                        return Center(child: Text('Aun no ha fichado'),);
                      }

                      return  Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount:mapa.values.last.length,
                            itemBuilder: (context, index) {

                              if(index<=1){
                                if(mapa.values.last[index]['check_out']!=null){
                                    return Column(
                                        children: [
                                          ListTile(
                                          tileColor: Colors.black,
                                          leading:Icon(Icons.play_arrow_rounded,
                                          size:MediaQuery.of(context).size.width*0.08,
                                          color: Colors.lightGreen,),
                                          title: Text(mapa.values.last[index]['check_in'].split(' ')[0]),
                                          trailing: Text(mapa.values.last[index]['check_in'].split(' ')[1])),
                                          ListTile(
                                          leading:Icon(Icons.stop,  size:MediaQuery.of(context).size.width*0.08,
                                          color: Colors.redAccent,),
                                          title: Text(mapa.values.last[index]['check_out'].split(' ')[0]),
                                          trailing: Text(mapa.values.last[index]['check_out'].split(' ')[1])
                                          )
                                        ],);
                                }
                                return  ListTile(
                                tileColor: Colors.black,
                                leading:Icon(Icons.play_arrow_rounded ,size:MediaQuery.of(context).size.width*0.08,
                                color: Colors.lightGreen,),
                                title: Text(mapa.values.last[index]['check_in'].split(' ')[0]),
                                subtitle:  Text(mapa.values.last[index]['total_time']),
                                trailing: Text(mapa.values.last[index]['check_in'].split(' ')[1])
                                );
                          }
                              else{
                                if(mapa.values.last[index]['check_out']!=null){
                                  return Column(
                                    children: [
                                      Visibility(
                                        visible: containerFichaje,
                                        child: Column(
                                          children: [
                                            ListTile(
                                                tileColor: Colors.black,
                                                leading:Icon(Icons.play_arrow_rounded,
                                                  size:MediaQuery.of(context).size.width*0.08,
                                                  color: Colors.lightGreen,),
                                                title: Text(mapa.values.last[index]['check_in'].split(' ')[0]),
                                                trailing: Text(mapa.values.last[index]['check_in'].split(' ')[1])
                                            ),
                                            ListTile(
                                                leading:Icon(Icons.stop,  size:MediaQuery.of(context).size.width*0.08,
                                                  color: Colors.redAccent,),
                                                title: Text(mapa.values.last[index]['check_out'].split(' ')[0]),

                                                trailing: Text(mapa.values.last[index]['check_out'].split(' ')[1])
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                }
                                return  Visibility(
                                  visible: containerFichaje,
                                  child: ListTile(
                                      tileColor: Colors.black,
                                      leading:Icon(Icons.play_arrow_rounded ,size:MediaQuery.of(context).size.width*0.08,
                                        color: Colors.lightGreen,),
                                      title: Text(mapa.values.last[index]['check_in'].split(' ')[0]),

                                      trailing: Text(mapa.values.last[index]['check_in'].split(' ')[1])
                                  ),
                                );
                           }}
                          ),
                        ),
                      );
                    }

                    return Container();
                  },
                ),
              ),
              Visibility(
                visible: true,
                  child: TextButton(onPressed: (){
                    containerFichaje==true? containerFichaje=false:containerFichaje=true;
                    setState(() {

                    });
                  }, child: Text('Mostrar todos'))),
              Container(

                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100.0),
                      ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.all(25)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        GestureDetector(
                          onTap: () async {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CalendarioTurno(usuario)),
                            );
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Icon(
                                      Icons.calendar_today,
                                      color: Colors.lightBlueAccent,
                                      size: MediaQuery.of(context).size.width *
                                          0.15,
                                    )),
                                const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text('Cambio Hora',
                                        style: TextStyle(color: Colors.lightBlueAccent)))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Solicitudes(usuario)),
                            );
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Icon(
                                      Icons.list_alt,
                                      color: Colors.lightBlueAccent,
                                      size: MediaQuery.of(context).size.width *
                                          0.15,
                                    )),
                                const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text('Solicitudes',
                                        style: TextStyle(color: Colors.lightBlueAccent)))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap:(){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Gastos(usuario)),
                            );
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Icon(
                                      Icons.receipt,
                                      color: Colors.lightBlueAccent,
                                      size: MediaQuery.of(context).size.width *
                                          0.15,
                                    )),
                                const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text('Gastos',
                                        style: TextStyle(color: Colors.lightBlueAccent)))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Documentos()),
                            );
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Icon(
                                      Icons.folder_copy,
                                      color: Colors.lightBlueAccent,
                                      size: MediaQuery.of(context).size.width *
                                          0.15,
                                    )),
                                const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text('Documentos',
                                        style: TextStyle(color: Colors.lightBlueAccent)))
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChatPage()),
                            );
                          },
                          child: Card(
                            color: Colors.white,
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: Icon(
                                      Icons.chat_rounded,
                                      color: Colors.lightBlueAccent,
                                      size: MediaQuery.of(context).size.width *
                                          0.15,
                                    )),
                                const Padding(
                                    padding: EdgeInsets.all(5),
                                    child: Text('Mensajes',
                                        style: TextStyle(color: Colors.lightBlueAccent)))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(20)),
                    Text('Notificaciones',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                    const Padding(
                      padding:EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Divider(
                        thickness: 3,
                      ),
                    ),
                    FutureBuilder(future: usuario.getNotificaciones(),builder: (context,snapshot){
                      if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {

                        Map mapa= snapshot.data as Map;

                        if(mapa.values.last.length==0){
                          return Text('Sin notificaciones pendientes');
                        }
                      return SingleChildScrollView(
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.4 ,
                          child: ListView.builder(
                            itemCount:mapa.values.last.length,
                            itemBuilder: (context, index) {
                              return  ListTile(
                                tileColor: Colors.black,
                                leading: Container(
                                  decoration:  BoxDecoration(
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                    color: HexColor(mapa.values.last[index]['color']),
                                  ),
                                  padding: const EdgeInsets.all(5),
                                  child:  Text(
                                    "${mapa.values.last[index]['siglas']}",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color:  Colors.white,
                                    ),
                                  ),
                                ),
                                title: Text("${mapa.values.last[index]['titulo']}"),
                                //subtitle:  ,
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("${mapa.values.last[index]['fecha']}"),

                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }
                    else {
                      return const CircularProgressIndicator();
                    }},),
                    Padding(padding: EdgeInsets.all(20))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.lightBlueAccent,
        child: BottomAppBar(
          shape: CircularNotchedRectangle(),
          //color of the BottomAppBar
          color: Colors.white,
          child: Container(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  //update the bottom app bar view each time an item is clicked
                  onPressed: () {
                    updateTabSelection(0, "Turnos");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CalendarioTurno(usuario)),
                    );
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.calendar_today,
                    //darken the icon if it is selected or else give it a different color
                    color: selectedIndex == 0
                        ? Colors.lightBlueAccent
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(1, "Solicitudes");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Solicitudes(usuario)),
                    );
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.list_alt,
                    color: selectedIndex == 1
                        ? Colors.lightBlueAccent
                        : Colors.grey.shade400,
                  ),
                ),
                //to leave space in between the bottom app bar items and below the FAB
                const SizedBox(
                  width: 30.0,
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(2, "Gastos");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Gastos(usuario)),
                    );
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.receipt,
                    color: selectedIndex == 2
                        ? Colors.lightBlueAccent
                        : Colors.grey.shade400,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    updateTabSelection(3, "Settings");
                  },
                  iconSize: 27.0,
                  icon: Icon(
                    Icons.settings,
                    color: selectedIndex == 3
                        ? Colors.lightBlueAccent
                        : Colors.grey.shade400,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
  Future<Widget> botonFichar() async{

    return Container();
  }
  String obtenerFecha() {
    final now = DateTime.now();
    return '${now.day}-${now.month}-${now.year}';
  }


}
