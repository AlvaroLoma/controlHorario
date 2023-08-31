import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled2/src/login.dart';
import 'package:untitled2/src/pantallas/CalendarioTurno.dart';
import 'package:untitled2/src/pantallas/Gastos.dart';
import 'package:untitled2/src/pantallas/Perfil.dart';
import 'package:untitled2/src/pantallas/documentos.dart';
import 'package:untitled2/src/pantallas/inicio.dart';

import 'model/user.dart';

class Inicio extends StatefulWidget {
  User usuario;
  Inicio(this.usuario,{super.key});

  @override
  State<Inicio> createState() => _Inicio(this.usuario);
}

class _Inicio extends State<Inicio> {
   User usuario;
  _Inicio(this.usuario);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 1,
        backgroundColor: Colors.white,
        child: SafeArea(
          child: Column(
            children:  [
               Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Container(
                  
                  height: 150,
                  width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/portada.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width*0.08,
                            backgroundColor: Colors.lightBlueAccent,
                            child: CircleAvatar(
                              radius: MediaQuery.of(context).size.width*0.075,
                              backgroundColor: Colors.white,

                              child:Icon(Icons.accessibility,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              )),
              Padding(padding: EdgeInsets.fromLTRB(10, 1, 10, 10),child: Divider(),),
              Expanded( flex:1,child: Column(children: [
                GestureDetector(
                  onTap: (){


                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 1, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Icon(Icons.calendar_month,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent,),
                      Text('Calendario',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                      Icon(Icons.arrow_forward_ios,size: MediaQuery.of(context).size.width*0.03)
                    ],),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 1, 10, 5),child: Divider(),),
                GestureDetector(
                  onTap: (){

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CalendarioTurno(usuario)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 1, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.calendar_today,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent,),
                        Text('Cambio de turno',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                        Icon(Icons.arrow_forward_ios,size: MediaQuery.of(context).size.width*0.03)
                      ],),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 1, 10, 5),child: Divider(),),
                GestureDetector(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 1, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.list_alt,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent,),
                        Text('Solicitudes',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                        Icon(Icons.arrow_forward_ios,size: MediaQuery.of(context).size.width*0.03)
                      ],),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 1, 10, 5),child: Divider(),),
                GestureDetector(
                  onTap:(){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Gastos(usuario)),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 1, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.receipt,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent,),
                        Text('Gastos',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                        Icon(Icons.arrow_forward_ios,size: MediaQuery.of(context).size.width*0.03)
                      ],),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 1, 10, 5),child: Divider(),),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Documentos()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 1, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.folder_copy,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent,),
                        Text('Documentos',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                        Icon(Icons.arrow_forward_ios,size: MediaQuery.of(context).size.width*0.03)
                      ],),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 1, 10, 5),child: Divider(),),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Documentos()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 1, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.message,size: MediaQuery.of(context).size.width*0.06,color: Colors.lightBlueAccent,),
                        Text('Chat',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04),),
                        Icon(Icons.arrow_forward_ios,size: MediaQuery.of(context).size.width*0.03)
                      ],),
                  ),
                ),
                Padding(padding: EdgeInsets.fromLTRB(10, 1, 10, 5),child: Divider(),),

              ],)),
              Expanded( flex: 1,child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(10, 1, 10, 5),child: Divider(),),
                  GestureDetector(
                    onTap: (){
                      usuario.logOff().then((value) =>  Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Login()),
                      ));

                    },
                    child:Padding(
                      padding: const EdgeInsets.fromLTRB(20, 5, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Cerrar sesión',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.05),),
                          Icon(Icons.logout,size: MediaQuery.of(context).size.width*0.05, color: Colors.black,)
                        ],),
                    ),
                  )

              ],))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.white, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        iconTheme: IconThemeData(color: Colors.lightBlueAccent[200]),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      Perfil(usuario)),
            );
          }, icon: Icon(
            color:Colors.lightBlueAccent,
            Icons.account_circle,
            size: MediaQuery.of(context).size.width * 0.06,
          ))
          ,
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 140,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5.0),
          child: Container(
              decoration:  const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              height: 90,
              padding: EdgeInsets.all(5),
              child: Image(image: AssetImage('assets/images/portada.png'))),
        ),
      ),
      body: Center(
        child: Principal(usuario),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


