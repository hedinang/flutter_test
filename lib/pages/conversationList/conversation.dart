import 'package:flutter/material.dart';

class ConversationWidget extends StatefulWidget {
  late String imgUrl;
  String userName;
  String lastMessage;
  String lastMessageTs;

  ConversationWidget(
      {super.key,
      required this.imgUrl,
      required this.userName,
      required this.lastMessage,
      required this.lastMessageTs});
  @override
  ConversationState createState() => ConversationState();
}

class ConversationState extends State<ConversationWidget> {
  late String imgUrl;
  late String userName;
  late String lastMessage;
  late String lastMessageTs;
  @override
  void initState() {
    super.initState();
    imgUrl = widget.imgUrl;
    userName = widget.userName;
    lastMessage = widget.lastMessage;
    lastMessageTs = widget.lastMessageTs;
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
              backgroundImage: AssetImage(imgUrl),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                ),
                Row(
                  children: [
                    Text(lastMessage),
                    const Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 10)),
                    Text('.$lastMessageTs')
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
