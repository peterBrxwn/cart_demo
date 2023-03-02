// Flutter imports:
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  final String message;
  const Message({
    this.message = 'Something went wrong.',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(child: Text(message)),
    );
  }
}
