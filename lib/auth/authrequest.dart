import 'dart:convert'; // For jsonEncode
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

//final storage = FlutterSecureStorage();

Future<void> getToken(String username, String password) async {
  var url = Uri.parse(
      'https://sea-turtle-app-k7x99.ondigitalocean.app/api/auth/login/');
  var body = jsonEncode({
    'username': username,
    'password': password,
  });

  var headers = {
    'Content-Type': 'application/json',
  };

  try {
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      String token =
          data['key']; // Adjust this depending on your API response structure
      print('Token: $token');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
      print('Token stored securely.');
    } else {
      print('Error: ${response.statusCode}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}
