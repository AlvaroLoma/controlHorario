import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login.dart';
import '../model/user.dart';

class NuevoGasto extends StatefulWidget {
  User user;
  NuevoGasto(this.user, {Key? key}) : super(key: key);

  @override
  State<NuevoGasto> createState() => _NuevoGastoState(user);
}

class _NuevoGastoState extends State<NuevoGasto>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late TabController _controller;
  int _selectedIndex = 0;
  String cantidad = "";
  User usuario;
  String tipoSol = 'Trayecto';
  bool tipoPago = false;
  List<Widget> list = [
    const Tab(
      text: 'Tipo de solicitud',
      icon: Icon(Icons.bookmark),
    ),
    const Tab(
      text: 'Datos',
      icon: Icon(Icons.info),
    ),
  ];
  var _images = [];
  File? _pickedFile;
  _NuevoGastoState(this.usuario);
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
                          tipoSol = 'Trayecto';
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
                                      Icon(Icons.drive_eta,
                                          size:
                                          MediaQuery.of(context).size.width * 0.10,
                                          color: Colors.lightBlueAccent),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(padding: EdgeInsets.all(5)),
                              Text(
                                'Trayecto',
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
                         tipoSol = 'Parking';
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
                                       Icon(Icons.local_parking,
                                           size:
                                           MediaQuery.of(context).size.width * 0.10,
                                           color: Colors.lightBlueAccent),
                                     ],
                                   ),
                                 ),
                               ),
                               const Padding(padding: EdgeInsets.all(5)),
                               Text(
                                 'Parking',
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
                          tipoSol = 'Hotel';
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
                                  'Hotel',
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
                          tipoSol = 'Comida';
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
                                        Icon(Icons.food_bank,
                                            size:
                                            MediaQuery.of(context).size.width * 0.10,
                                            color: Colors.lightBlueAccent),

                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'Comidas',
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        tipoSol = 'Varios';
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
                                        Icon(Icons.widgets_outlined,
                                            size:
                                            MediaQuery.of(context).size.width * 0.10,
                                            color: Colors.lightBlueAccent),

                                      ],
                                    ),
                                  ),
                                ),
                                const Padding(padding: EdgeInsets.all(5)),
                                Text(
                                  'Varios',
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
                    )

                  ],
                )
              ],
            ),
          ),
          Column(
            children: [

              const Padding(padding: EdgeInsets.all(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tipoPago = true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow),
                        borderRadius: BorderRadius.circular(5),
                        color: tipoPago ? Colors.yellow : Colors.white,
                      ),
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Efectivo',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(Icons.monetization_on),
                        ],
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(5)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        tipoPago = false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(5),
                        color: !tipoPago ? Colors.blueAccent : Colors.white,
                      ),
                      padding: const EdgeInsets.fromLTRB(5, 15, 5, 15),
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Tarjeta',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(Icons.payment),

                        ],
                      ),
                    ),
                  )
                ],
              ),
              const Padding(padding: EdgeInsets.all(30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    width: MediaQuery.of(context).size.width * 0.45,
                    child: IconButton(icon: const Icon(Icons.camera_alt),
                      onPressed: () async {
                        FilePickerResult? result = await FilePicker.platform.pickFiles();

                        if (result != null) {
                          File file = File([],result.files.single.path!);
                        } else {
                          // User canceled the picker
                        }
                    },),
                  ),

                  const Padding(padding: EdgeInsets.all(5)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.only(left: 10),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                iconColor: Colors.blue,
                                border: InputBorder.none,
                                hintText: 'Cantidad',
                                prefixIcon: Icon(
                                  Icons.euro,
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                              validator: (value) {
                                if (value != null) {
                                  if (value.isEmpty) {
                                    return 'Introduzca una cantidad';
                                  } else {
                                    cantidad = value;
                                  }
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 30, 40, 50),
                child: ButtonWidget(
                  onClick: () async {
                    if (_formKey.currentState!.validate()) {
                      usuario.sendGasto(cantidad, tipoPago, tipoSol);
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Solicitud de Gasto enviada'),
                      ));
                      Navigator.pop(context);
                    }
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
}
