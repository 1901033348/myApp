class GalleryComplete {
  int id = 0;
  String title = '';

  GalleryComplete(this.id, this.title);

  GalleryComplete.fromJson(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
  }
}
