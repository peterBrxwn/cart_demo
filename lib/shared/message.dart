// Flutter imports:
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  const Message({
    Key? key,
    this.message = 'Something went wrong.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(child: Text(message)),
    );
  }
}
