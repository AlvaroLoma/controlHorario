import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Documentos extends StatefulWidget {
  const Documentos({Key? key}) : super(key: key);

  @override
  State<Documentos> createState() => _DocumentosState();
}

class _DocumentosState extends State<Documentos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documentos'),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue, // <-- SEE HERE
          statusBarIconBrightness: Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness: Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(padding:EdgeInsets.all(20),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.folder_copy, color: Colors.lightGreen, size: MediaQuery.of(context).size.width*0.10,) ),
                    Text('Carpeta 1')
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.folder_copy, color: Colors.lightBlueAccent, size: MediaQuery.of(context).size.width*0.10,) ),
                    Text('Carpeta 2')
                  ],
                ),
                Column(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.folder_copy, color: Colors.lightBlueAccent, size: MediaQuery.of(context).size.width*0.10,) ),
                    Text('Carpeta 3')
                  ],
                ),
              ],
            ),
            Padding(padding:EdgeInsets.all(20),),
            Expanded(
              child: Container(

                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: const Icon(Icons.picture_as_pdf,color: Colors.red,),
                          trailing: Icon(Icons.arrow_circle_down_outlined,color: Colors.green,),
                          title: Text("Archivo $index"),
                      subtitle: Text('Subido el 12-08-2023'),);

                    }),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                child: Text(
                  'Subir Archivo',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    elevation: 1,
                    backgroundColor: Colors.lightBlue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
