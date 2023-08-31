import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';


class User{

  String _token;
  String dir;
  String numero;
  String email;
  String name;
  String surname;
  String phone;
  int vacaciones;
  String sede;
  String dni;



  User(this._token,this.dir,this.name,this.surname,this.email,this.phone,this.numero,this.vacaciones,this.sede,this.dni);

  Future<void> fichar() async {
    var url = Uri.https(dir, '/api/fichar/fichar');
    Position? position = await GeolocatorService().determinePosition().catchError((error)=>print(error));

    if(position!=null){
      var response = await http.post(url,
          headers:{'Authorization':'Bearer ${this._token}'},
          body: {'latitud': '${position?.latitude}', 'longitud': '${position?.longitude}'}
      );

    }else{

      var response = await http.post(url,
          headers:{'Authorization':'Bearer ${this._token}'},
          body: {'error': 'GPS DENEGADO'}
      );

    }



  }
  Future<Map> getInfo() async {
    var url = Uri.https(dir, '/api/currentuserinfo');
    var response = await http.post(url,
        headers:{'Authorization':'Bearer ${this._token}'},
    );

    Map data={};
    if(response.statusCode==200){

      data = jsonDecode(response.body);
      return data;
    }


    return data;
  }
  Future<Map> getCalendario() async {
    var url = Uri.https(dir, '/api/calendarios/calendarioUser');
    var response = await http.post(url,
      headers:{'Authorization':'Bearer ${this._token}'},

    );
    Map data;
    data = jsonDecode(response.body);

    return data;
  }
  Future<Map> getCalendarioHoras() async {
    var url = Uri.https(dir, '/api/fichar/getFichajes');
    var response = await http.post(url,
      headers:{'Authorization':'Bearer ${this._token}'},
    );

    Map data;
    data = jsonDecode(response.body);
    return data;
  }
  Future<void> logOff() async {
    var url = Uri.https(dir, '/api/logout');
    var response = await http.post(url,
      headers:{'Authorization':'Bearer ${this._token}'},
    );
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('dir');
  }
  Future<Map> getNotificaciones() async {
    Map data={};
    var url = Uri.https(dir, '/api/notificaciones/user');
    var response = await http.post(url,
      headers:{'Authorization':'Bearer ${this._token}'},
    );

    if(response.statusCode==200){
      data = jsonDecode(response.body);

      return data;
    }
    return data;
  }
  Future<Map> getGastos(String tipo, String tipoEstado) async{
    Map data={};
    var url = Uri.https(dir, '/api/gastos/getUser');
    var response = await http.post(url,
      headers:{'Authorization':'Bearer ${this._token}'},
        body: {'tipo': tipo,'estado':tipoEstado}
    );
    if(response.statusCode==200){
      data = jsonDecode(response.body);
    }
    return data;
  }
  Future<void> sendGasto(String cantidad, bool tipoPago, String tipoSol) async {
    Map data={};
    String pago='Tarjeta';
    var url = Uri.https(dir, '/api/gastos/nuevoUser');
    if(tipoPago){
      pago='Efectivo';
    }
    var response = await http.post(url,
        headers:{'Authorization':'Bearer ${this._token}'},
        body: {'cantidad': cantidad,'pago':pago,'tipo':tipoSol}
    );

  }
  Future<Map> getSolicitudes(String tipoSol, String tipoEstado) async {
    Map data={};

    var url = Uri.https(dir, '/api/solicitudes/getUser');

    var response = await http.post(url,
        headers:{'Authorization':'Bearer ${this._token}'},
        body: {'tipo': tipoSol,'estado':tipoEstado}
    );
    if(response.statusCode==200){
      data = jsonDecode(response.body);

    }
    return data;
  }
  Future<Map>nextFichaje() async {

    Map data={};
    var url = Uri.https(dir, '/api/currentuserinfo/nextFichaje');
    var response = await http.post(url,
        headers:{'Authorization':'Bearer ${this._token}'},
    );
    if(response.statusCode==200){
      data = jsonDecode(response.body);

    }
    return data;


  }

  Future<Map> getTurnos() async{
    var url = Uri.https(dir, '/api/calendarios/getTurnos');
    var response = await http.post(url,
      headers:{'Authorization':'Bearer ${this._token}'},
    );

    Map data;
    data = jsonDecode(response.body);
    return data;
  }

  Future<Map>  getFichajeDia(String fecha) async {
    Map data={};
    var url = Uri.https(dir, '/api/calendarios/getFichajeDia');
    var response = await http.post(url,
        headers:{'Authorization':'Bearer ${this._token}'},
        body: {'fecha': fecha}
    );
    if(response.statusCode==200){
      data = jsonDecode(response.body);

    }
    return data;
  }

  void mandarSolicitudes(Map<int, String> horasEntradas, Map<int, String> horasSalida) async{


    var url = Uri.https(dir, '/api/calendarios/cambioHora');
    var response = await http.post(url,
        headers:{'Authorization':'Bearer ${this._token}'},
        body: {'checkInNuevo':horasEntradas.toString(), 'checkOutNuevo':horasSalida.toString()}
    );
   print(response.body);
  }

  Future<void> sendSolicitud(String tipoSol, List<DateTime?> dates, int i) async {
    var url = Uri.https(dir, '/api/solicitudes/nuevaMovil');
    var response = await http.post(url,
        headers:{'Authorization':'Bearer ${this._token}'},
        body: {'tipoSol':tipoSol, 'fechas':dates,'turno':i}
    );

  }

  Future<Map> getTurnosAll() async{
    var url = Uri.https(dir, '/api/calendarios/getTurnosAll');
    var response = await http.post(url,
      headers:{'Authorization':'Bearer ${this._token}'},
    );

    Map data;
    data = jsonDecode(response.body);
    return data;
  }


 // {"token":"30|7oQoQnwilljE58s9Vw9bCgIoTexJwoArEGQjnHjG","user":{"id":4,"name":"Sergio","surname":"","email":"sergio@dinan.es","role":"Dinan","phone":"","numero":null,"dni":"","siglas":"SE","departamento":null,"observaciones":null,"estado":"Activo"}}
}
class GeolocatorService {
  Future<Position?> determinePosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Denegada para siempre');
      }
      return Future.error('Denegada');
    } else {
      return await Geolocator.getCurrentPosition();
      throw Exception('Error');
    }

  }
}