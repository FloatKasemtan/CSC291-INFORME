import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:informe/models/response/info_response.dart';

class Alert {
  static Future<dynamic> successAlert(
    InfoResponse result,
    String title,
    VoidCallback pressHandler,
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('$title Success!'),
        content: Text(result.message),
        actions: <Widget>[
          TextButton(
            onPressed: pressHandler,
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  static Future<dynamic> errorAlert(DioError e, BuildContext context) {
    if (e.response!.data is Map<String, dynamic>) {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Something went wrong!'),
          content: Text(e.response?.data["message"]),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Something went wrong!'),
        content: Text(e.message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
