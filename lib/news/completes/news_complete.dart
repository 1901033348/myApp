class NewsComplete {
  int id = 0;
  String title = '';
  String body = '';

  NewsComplete(this.id, this.title, this.body);
  NewsComplete.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    body = data['body'];
  }
}
