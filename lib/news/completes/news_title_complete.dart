class NewsTitleComplete {
  int postId = 0;
  String name = '';
  String email = '';
  String body = '';

  NewsTitleComplete(this.postId, this.name, this.email, this.body);

  NewsTitleComplete.fromJson(Map<String, dynamic> data) {
    postId = data['postId'];
    name = data['name'];
    email = data['email'];
    body = data['body'];
  }
}
