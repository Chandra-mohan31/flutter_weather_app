import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Warning extends StatelessWidget {
  final String warning_message;
  const Warning({super.key, required this.warning_message});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: Text(
            warning_message,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, fontStyle: FontStyle.italic, color: Colors.red),
          ),
        ),
        ElevatedButton(
            onPressed: () => openAppSettings(), child: Text('Go to Settings'))
      ],
    );
  }
}
