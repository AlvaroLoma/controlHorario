import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';

class Perfil extends StatefulWidget {
    User user;
  Perfil(this.user,{Key? key}) : super(key: key);

  @override
  State<Perfil> createState() => _PerfilState(user);
}

class _PerfilState extends State<Perfil> {
  User user;
  _PerfilState(this.user);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('${user.name} ${user.surname}'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
             decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.lightBlueAccent, Colors.blue],
                    end: Alignment.centerLeft,
                    begin: Alignment.centerRight),
              ),
              child:  Center(
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.18,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width*0.17,
                    backgroundColor: Colors.white,

                    child:Icon(Icons.accessibility,size: MediaQuery.of(context).size.width*0.2,color: Colors.lightBlueAccent ),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.lightBlueAccent, Colors.blue],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                    ),
                    child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0.0, 1.0), //(x,y)
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text('${user.vacaciones}',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.08),),
                        Text('Dias pendientes',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.02),),
                        Text('Vacaciones',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),)
                      ],
                    ),) ),
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.lightBlueAccent, Colors.blue],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text('17:00',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.08),),
                          Text('14/08/2023',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.02),),
                          Text('Proxima Jornada',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),)
                        ],
                      ),) ),
                Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.lightBlueAccent, Colors.blue],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(5.0),
                          bottomRight: Radius.circular(5.0),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text('50',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.08),),
                          Text('este mes',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.02),),
                          Text('H. Trabajadas',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.03),)
                        ],
                      ),) ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(15)),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(

                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.0),
                    topLeft: Radius.circular(30.0),

                  ),
                ),

                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 15, 5),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Container(
                              padding: const EdgeInsets.all(5),
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.lightBlue),
                                gradient: const LinearGradient(
                                    colors: [Colors.lightBlueAccent, Colors.blue],
                                    end: Alignment.centerLeft,
                                    begin: Alignment.centerRight),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                              ),
                              child: const Icon(Icons.phone,color: Colors.white,) ),
                          Container(  width: MediaQuery.of(context).size.width*0.4,child: Text('${user.phone}',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04))),
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.lightBlue),
                                gradient: const LinearGradient(
                                    colors: [Colors.lightBlueAccent, Colors.blue],
                                    end: Alignment.centerLeft,
                                    begin: Alignment.centerRight),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                              ),
                              child: const Icon(Icons.assignment_ind,color: Colors.white,) ),
                          Container(  width: MediaQuery.of(context).size.width*0.3,child: Text('${user.dni}',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04))),

                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.lightBlue),
                                gradient: const LinearGradient(
                                    colors: [Colors.lightBlueAccent, Colors.blue],
                                    end: Alignment.centerLeft,
                                    begin: Alignment.centerRight),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                              ),
                              child: const Icon(Icons.alternate_email,color: Colors.white,) ),
                          Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Text('${user.email}',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04))),
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.lightBlue),
                                gradient: const LinearGradient(
                                    colors: [Colors.lightBlueAccent, Colors.blue],
                                    end: Alignment.centerLeft,
                                    begin: Alignment.centerRight),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                              ),
                              child: const Icon(Icons.work,color: Colors.white,) ),
                          Container( width: MediaQuery.of(context).size.width*0.3,child: Text('${user.numero}',style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04))),

                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 10, 15, 10),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:  [
                          Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1, color: Colors.lightBlue),
                                gradient: const LinearGradient(
                                    colors: [Colors.lightBlueAccent, Colors.blue],
                                    end: Alignment.centerLeft,
                                    begin: Alignment.centerRight),
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(5.0),
                                  topLeft: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0),
                                ),
                              ),
                              child: const Icon(Icons.public,color: Colors.white,) ),
                          Text(user.dir,style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04)),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
