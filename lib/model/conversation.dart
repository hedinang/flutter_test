class Conversation {
  final String imgUrl;
  final String userName;
  final String lastMessage;
  final String lastMessageTs;

  Conversation(
      {required this.imgUrl,
      required this.userName,
      required this.lastMessage,
      required this.lastMessageTs});
}
