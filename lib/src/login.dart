import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:untitled2/src/model/user.dart';
import 'package:untitled2/src/principal.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
   String email="";
   String password="";
   String cif="";
   SnackBar snackBar = SnackBar(
    content: Text('Inicio de sesion incorrecto'),
  );
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: hasLogin(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            height: MediaQuery.of(context).size.height*0.8,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child:  Image(image: AssetImage('assets/icono/iconoDinanH.png')),
          );
        }
        else if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.data!=null){
              return Inicio(snapshot.data);
            }else{
              return  Scaffold(
                body: Center(
                  child: Container(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: <Widget>[
                        HeaderContainer("Control Horario"),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          iconColor: Colors.blue,
                                          border: InputBorder.none,
                                          hintText: 'Cif',
                                          prefixIcon: Icon( Icons.account_box_sharp,color: Colors.blue,),
                                        ),
                                        validator: (value) {
                                          if(value != null){
                                            if(value.isEmpty){
                                              return 'Introduzca un cif';

                                            }else{
                                              cif=value;
                                            }
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          iconColor: Colors.blue,
                                          border: InputBorder.none,
                                          hintText: 'Email',
                                          prefixIcon: Icon( Icons.email,color: Colors.blue,),
                                        ),
                                        validator: (value) {
                                          if(value != null){
                                            if(value.isEmpty){
                                              return 'Introduzca un email';

                                            }else{
                                              email=value;
                                            }
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(20)),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          iconColor: Colors.blue,
                                          border: InputBorder.none,
                                          hintText: 'Contraseña',
                                          prefixIcon: Icon( Icons.vpn_key,color: Colors.blue,),
                                        ),
                                        validator: (value) {
                                          if(value != null){
                                            if(value.isEmpty){
                                              return 'Introduzca una contraseña';

                                            }else{
                                              password=value;
                                            }
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      alignment: Alignment.centerRight,
                                      child: const Text(
                                        "Recordar Contraseña",
                                        style: TextStyle(fontFamily: "Sofia"),
                                      ),
                                    ),
                                    ButtonWidget(
                                      onClick: () async {
                                        if (_formKey.currentState!.validate()) {

                                          User? usuario= await iniciar();
                                          if(usuario!=null){
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  Inicio(usuario)),
                                            );
                                          }
                                          // Si el formulario es válido, queremos mostrar un Snackbar
                                          //Scaffold.of(context)
                                          //.showSnackBar(SnackBar(content: Text('Processing Data')));
                                        }

                                      },
                                      btnText: "Iniciar sesion",
                                    ),
                                    RichText(
                                      text: const TextSpan(children: [
                                        TextSpan(
                                            text: "Problemas para acceder ? ",
                                            style: TextStyle(
                                                color: Colors.black, fontFamily: "Sofia")),
                                        TextSpan(
                                            text: "Contacta",
                                            style: TextStyle(
                                                color: Colors.blue, fontFamily: "Sofia")),
                                      ]),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }
        }
        return Container();
      },

    );
  }
  Future<User?> iniciar() async {
    Map data={};
    String dir = '${cif}.miportaldepersonal.es';
    var url = Uri.https(dir, '/api/login');
    var response = await http.post(url, body: {'email': email, 'password': password});

    if(response.statusCode==200) {
      data = jsonDecode(response.body);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('dir', dir);
      await prefs.setString('email', data['user']['email']);
      await prefs.setString('password', password);
      return User(
          data['token'],
          dir,
          data['user']['name'],
          data['user']['surname'],
          data['user']['email'],
          data['user']['phone'],
          data['user']['numero'],
          data['user']['diasVacaciones'],
          data['user']['sede']['name'],
          data['user']['dni'],
          );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  return null;
  }

  Future<User?> hasLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? email = prefs.getString('email');
    if(email!=null){
      final String? password = prefs.getString('password');
      final String? dir = prefs.getString('dir');
      if(password!=null && dir!=null){
        var url = Uri.https(dir, '/api/login');
        var response = await http.post(url, body: {'email': email, 'password': password});
        if(response.statusCode==200) {
          Map data={};
          data = jsonDecode(response.body);

          return User(
            data['token'],
            dir,
            data['user']['name'],
            data['user']['surname'],
            data['user']['email'],
            data['user']['phone'],
            data['user']['numero'],
            data['user']['diasVacaciones'],
            data['user']['sede']['name'],
            data['user']['dni'],
          );
        }
      }

    }
    return null;
  }
 
}

class HeaderContainer extends StatelessWidget {
  var text = "Control Horario";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {


    return Container(
      height: MediaQuery.of(context).size.height * 0.4,

      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.lightBlueAccent, fontSize: 22, fontFamily: "Sofia"),
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Center(
              child: Image.asset("assets/images/portada.png", height: 150.0),
            ),
          ),
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  String? btnText = "";
  var onClick;

  ButtonWidget({this.btnText, this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blue],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText!,
          style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: "Sofia"),
        ),
      ),
    );
  }
}
