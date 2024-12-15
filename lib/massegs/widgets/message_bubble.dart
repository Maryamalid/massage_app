import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final String sender;
  final String text;
  final DateTime? timestamp;
  final bool isMe;

  const MessageBubble({
    required this.sender,
    required this.text,
    required this.isMe,
    this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    String formattedTime = '';
    if (timestamp != null) {
      formattedTime = DateFormat('hh:mm a').format(timestamp!);
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Material(
            borderRadius: BorderRadius.only(
              topLeft: isMe ? Radius.circular(10) : Radius.zero,
              topRight: isMe ? Radius.zero : Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            elevation: 5,
            color: isMe
                ? Color.fromARGB(255, 110, 156, 156)
                : Color.fromARGB(255, 235, 105, 105),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 15,
                      color: isMe ? Colors.white : Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    formattedTime, // Show time
                    style: TextStyle(
                      fontSize: 12,
                      color: isMe ? Colors.white70 : Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
