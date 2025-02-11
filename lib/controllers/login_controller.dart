import 'package:flutter/material.dart';
// import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

Future<bool> login(String email, String password) async {
  const String baseUrl = 'http://10.0.2.2:8000/api/users'; // emulador Android
  // const String baseUrl = 'http://localhost:8000/api/register';  // emulador Web

  var client = http.Client();
  var url = Uri.parse(baseUrl);
  var headers = {
    'Accept': 'application/json',
    'Content-Type': 'application/json',
    'cache-control': 'no-cache'
  };

  var response = await client.get(url, headers: headers);

  debugPrint(response.body);

  // Verifica si la respuesta es exitosa (código 200)
  if (response.statusCode == 200) {
    return true; // Autenticación exitosa
  } else {
    return false; // Autenticación fallida
  }
}
