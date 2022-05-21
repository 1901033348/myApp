class GalleryTitleComplete {
  int albumId = 0;
  int id = 0;
  String title = '';
  String url = '';
  String thumbnailUrl = '';

  GalleryTitleComplete(
      this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  GalleryTitleComplete.fromJson(Map<String, dynamic> data) {
    albumId = data['albumId'];
    id = data['id'];
    title = data['title'];
    url = data['url'];
    thumbnailUrl = data['thumbnailUrl'];
  }
}
