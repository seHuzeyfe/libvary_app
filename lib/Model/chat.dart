class Chat {
  final String name, lastMessage, image, time;
  final bool isActive;

  Chat({
    this.name = '',
    this.lastMessage = '',
    this.image = '',
    this.time = '',
    this.isActive = false,
  });
}

List chatsData = [
  Chat(
    name: "Aslı Gürbüz",
    lastMessage: "AYT Matematik kitabıyla ilgileniyorum",
    image: "assets/images/user_5.png",
    time: "3m ago",
    isActive: false,
  ),
  Chat(
    name: "Celil Korkmaz",
    lastMessage: "Merhaba",
    image: "assets/images/user_3.png",
    time: "8m ago",
    isActive: true,
  ),
];



