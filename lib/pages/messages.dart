// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class MessagesPage extends StatefulWidget {
  final List messages;
  const MessagesPage({super.key, required this.messages});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
      itemCount: widget.messages.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: widget.messages[index]['isUserMessage']
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 14,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomRight: Radius.circular(
                    widget.messages[index]['isUserMessage'] ? 0 : 20,
                  ),
                  topLeft: Radius.circular(
                    widget.messages[index]['isUserMessage'] ? 20 : 0,
                  ),
                ),
                color: widget.messages[index]['isUserMessage']
                    ? Colors.grey.shade800
                    : Colors.grey.shade900.withOpacity(0.8),
              ),
              constraints: BoxConstraints(maxWidth: w * 2 / 3),
              child: Text(
                widget.messages[index]['message'].text.text[0],
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
