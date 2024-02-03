import 'dart:convert';

import '../../constants.dart';
import 'package:http/http.dart' as http;

class SendNotification {
  static sendNotification(
      {required String body,
      required String title,
      required String token}) async {
    try {
      // Set the FCM server key and the FCM endpoint URL

// Set the headers for the HTTP request
      Map<String, String> headers = {
        "Authorization": "key=$fcmServerKey",
        "Content-Type": "application/json"
      };

// Set the message data in JSON format
      Map<String, dynamic> messageData = {
        "to": token,
        "notification": {"body": body, "title": title, "subtitle": "m"}
      };

// Send the HTTP POST request to the FCM API
      http
          .post(Uri.parse(fcmEndpointUrl),
              headers: headers, body: json.encode(messageData))
          .then((response) {
        // Print the response status code and content
        print("Response status code: ${response.statusCode}");
        print("Response content: ${response.body}");
      }).catchError((error) {
        // Handle the error
        print("Error sending FCM message: $error");
      });
      print("sendded");
      // Map<String,dynamic> data =  jsonDecode(response.body);
      // weather = WeatherModel.fromJson(data);
    } catch (e) {
      print(e.toString());
      ;
    }
  }
}
