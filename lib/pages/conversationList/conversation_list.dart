import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn/model/conversation.dart';
import 'package:learn/pages/conversationList/conversation.dart';
import 'package:learn/pages/home/home.dart';
import 'package:learn/widgets/input.dart';

class ConversationList extends StatelessWidget {
  String data = "sdsdsd";
  List<Conversation> conversationList = [
    Conversation(
        imgUrl: "assets/images/weathers/cat.jpg",
        userName: "Dũng Trần",
        lastMessage: "Hello how are you",
        lastMessageTs: "19:10"),
    Conversation(
        imgUrl: "assets/images/weathers/cat.jpg",
        userName: "Andrew",
        lastMessage: "I am fine",
        lastMessageTs: "19:12"),
    Conversation(
        imgUrl: "assets/images/weathers/cat.jpg",
        userName: "Dũng Trần",
        lastMessage: "Hello how are you",
        lastMessageTs: "19:10"),
    Conversation(
        imgUrl: "assets/images/weathers/cat.jpg",
        userName: "Andrew",
        lastMessage: "I am fine",
        lastMessageTs: "19:12"),
    Conversation(
        imgUrl: "assets/images/weathers/cat.jpg",
        userName: "Dũng Trần",
        lastMessage: "Hello how are you",
        lastMessageTs: "19:10"),
    Conversation(
        imgUrl: "assets/images/weathers/cat.jpg",
        userName: "Andrew",
        lastMessage: "I am fine",
        lastMessageTs: "19:12"),
    Conversation(
        imgUrl: "assets/images/weathers/cat.jpg",
        userName: "Dũng Trần",
        lastMessage: "Hello how are you",
        lastMessageTs: "19:10"),
    Conversation(
        imgUrl: "assets/images/weathers/cat.jpg",
        userName: "Andrew",
        lastMessage: "I am fine",
        lastMessageTs: "19:12")
  ];

  ConversationList({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    }

    return Scaffold(
      body: Stack(
        children: [
          const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.chat,
                    size: 35,
                  ),
                  Icon(Icons.video_call, size: 35),
                  Icon(Icons.room, size: 35),
                  Icon(Icons.camera, size: 35),
                ],
              )),
          Column(
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      ),
                      Icon(Icons.menu),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      ),
                      Text(
                        'Chats',
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.edit),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      ),
                    ],
                  )
                ],
              ),
              Input(
                  title: "Search",
                  data: data,
                  prefixIcon: Icons.search,
                  suffixIcon: null,
                  obscure: false),
              Column(
                  children: conversationList
                      .map((conversation) => ConversationWidget(
                          imgUrl: conversation.imgUrl,
                          userName: conversation.userName,
                          lastMessage: conversation.lastMessage,
                          lastMessageTs: conversation.lastMessageTs))
                      .toList()),
            ],
          ),
        ],
      ),
    );
  }
}
