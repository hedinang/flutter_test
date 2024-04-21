import 'package:flutter/material.dart';

class ConversationWidget extends StatefulWidget {
  final String? imgUrl;
  final String name;
  final String lastMessage;
  final String lastMessageTs;

  const ConversationWidget(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.lastMessage,
      required this.lastMessageTs});
  @override
  ConversationState createState() => ConversationState();
}

class ConversationState extends State<ConversationWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0)),
            CircleAvatar(
              radius: 25,
              backgroundImage:
                  AssetImage(widget.imgUrl ?? 'assets/images/weathers/cat.jpg'),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                ),
                Row(
                  children: [
                    Text(widget.lastMessage),
                    const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 10)),
                    Text(widget.lastMessageTs)
                  ],
                )
              ],
            ),
          ],
        ),
        const Padding(padding: EdgeInsets.fromLTRB(0, 25, 0, 30))
      ],
    );
  }
}
