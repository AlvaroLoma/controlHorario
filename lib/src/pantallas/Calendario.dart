import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../login.dart';
import 'CalendarioListado.dart';
import 'Cuadricula.dart';



class Calendario extends StatefulWidget {
  Map data;
  Calendario(this.data);

  @override
  State<StatefulWidget> createState() {
    return _CalendarioState(this.data);
  }
}

class _CalendarioState extends State<Calendario> with SingleTickerProviderStateMixin{
  Map data;
  _CalendarioState(this.data);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Calendario'),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.10,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width*0.095,
                    backgroundColor: Colors.blue[50],

                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.beach_access,size: MediaQuery.of(context).size.width*0.06),
                        Text('${data['vacaciones']} dias',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03 ),),
                        Text('Vacaciones',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03 ))
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.10,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(

                    radius: MediaQuery.of(context).size.width*0.095,
                    backgroundColor: Colors.blue[50],
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.hotel,size: MediaQuery.of(context).size.width*0.06),
                        Text('${data['descanso']} dias',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03 ),),
                        Text('Descanso',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03 ),)
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.10,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width*0.095,
                    backgroundColor: Colors.blue[50],
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.healing,size: MediaQuery.of(context).size.width*0.06),
                        Text('${data['baja']} dias',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03 ),),
                        Text('Baja',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03 ),)
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width*0.10,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: MediaQuery.of(context).size.width*0.095,
                    backgroundColor: Colors.blue[50],
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_remove,size: MediaQuery.of(context).size.width*0.06),
                        Text('${data['propios']} dias',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03 ),),
                        Text('A. Propios',style: TextStyle(fontSize:MediaQuery.of(context).size.width*0.03 ),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10)),
            Cuadricula(data),
            const Padding(padding: EdgeInsets.all(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.blue[50],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.green[50],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('Descanso'),
                    Padding(padding: EdgeInsets.all(5)),
                    Text('Vacaciones')
                  ],
                ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey[50],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.yellow[50],
                      ),
                    ),
                  ],
                ),
                Column(
                children: [
                  Text('Ausencia'),
                  Padding(padding: EdgeInsets.all(5)),
                  Text('B. Laboral')
                ],
              ),
                Column(
                  children: [
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.red[50],
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(5)),
                    CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.black,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey[300],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text('A. Propios'),
                    Padding(padding: EdgeInsets.all(5)),
                    Text('Laboral')
                  ],
                )

              ],
            ),
            const Padding(padding: EdgeInsets.all(20)),
            TextButton(
              child: Text(
                'Nueva Solicitud',
                style: TextStyle(fontSize: 20),
              ),
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  elevation: 1,
                  backgroundColor: Colors.lightBlue),
            ),
          ],
        ),
      ),
    );
  }


}


