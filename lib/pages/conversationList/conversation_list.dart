import 'package:flutter/material.dart';
import 'package:learn/api/conversation.dart';
import 'package:learn/model/conversation.dart';
import 'package:learn/pages/conversationList/conversation.dart';
import 'package:learn/widgets/input.dart';

class ConversationList extends StatefulWidget {
  static const int limit = 10;
  static ConversationApi conversationApi = ConversationApi();

  const ConversationList({super.key});

  @override
  ConversationListState createState() => ConversationListState();
}

class ConversationListState extends State<ConversationList> {
  List<Conversation> conversationList = [];
  String contentSearch = '';
  DateTime ts = DateTime.now();
  @override
  void initState() {
    super.initState();
    _setContentSearch('');
  }

  void _setConversationList(data) {
    setState(() {
      conversationList = data;
    });
  }

  Future<void> _setContentSearch(contentSearchInput) async {
    final result = await ConversationList.conversationApi.getList({
      'limit': ConversationList.limit,
      'ts': ts.toIso8601String(),
      'search': {'searchName': contentSearchInput}
    });

    if (result.statusCode == 400) {
      print("aaa");
    } else {
      List<Conversation> aa = result.data
          .map<Conversation>((r) => Conversation(
              null, r['name'], r['lastMessage'], r['lastMessageTs']))
          .toList();
      _setConversationList(aa);
    }
  }

  void logout(BuildContext context) {
    Navigator.pop(context, '/home1');
  }

  @override
  Widget build(BuildContext context) {
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
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
                      const Icon(Icons.edit),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      ),
                      GestureDetector(
                          onTap: () => {logout(context)},
                          child: const Icon(Icons.logout)),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
                      ),
                    ],
                  )
                ],
              ),
              Input(
                title: "Search",
                prefixIcon: Icons.search,
                suffixIcon: null,
                obscure: false,
                setData: _setContentSearch,
              ),
              Column(
                  children: conversationList
                      .map((conversation) => ConversationWidget(
                          imgUrl: conversation.imgUrl ?? '',
                          name: conversation.name,
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
