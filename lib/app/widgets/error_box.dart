import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  final String message;
  final bool isSuccess;
  ErrorBox({this.message,this.isSuccess = false});
  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();
    return Container(
      padding: const EdgeInsets.all(8),
      color: isSuccess ? Colors.green : Colors.red,
      child: Row(
        children: [
          Icon(
            isSuccess ? Icons.check_circle : Icons.error_outline,
            color: Colors.white,
            size: 40,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: isSuccess ? Text(
              'Ooba! ${message}',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ) : Text(
              'Oops! ${message}. Por favor, tente novamente.',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
