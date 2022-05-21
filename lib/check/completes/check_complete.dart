class CheckComplete {
  bool completed = false;
  String title = '';

  CheckComplete(this.completed, this.title);

  CheckComplete.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    completed = data['completed'];
  }
}
