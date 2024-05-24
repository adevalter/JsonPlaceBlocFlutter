class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;

  Posts(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  factory Posts.fromJson(Map<String, dynamic> data) {
    return Posts(
        userId: data['userId'],
        id: data['id'],
        title: data['title'],
        body: data['body']);
  }
}
