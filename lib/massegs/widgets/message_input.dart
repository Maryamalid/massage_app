import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageInput extends StatefulWidget {
  @override
  _MessageInputState createState() => _MessageInputState();
}

class _MessageInputState extends State<MessageInput> {
  final _firestore = FirebaseFirestore.instance;
  final messageTextController = TextEditingController();
  String messageText = '';

  void sendMessage() {
    if (messageText.trim().isEmpty) return;

    final currentUser = FirebaseAuth.instance.currentUser;

    _firestore.collection('messages').add({
      'text': messageText,
      'sender': currentUser?.email,
      'timestamp': FieldValue.serverTimestamp(),
    });

    messageTextController.clear();
    setState(() {
      messageText = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color.fromARGB(255, 96, 139, 139),
            width: 2,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: messageTextController,
              onChanged: (value) {
                setState(() {
                  messageText = value;
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                hintText: 'Write your message here ... ',
                border: InputBorder.none,
              ),
            ),
          ),
          TextButton(
            onPressed: sendMessage,
            child: Text(
              'Send',
              style: TextStyle(
                color: Color.fromARGB(255, 227, 86, 86),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
