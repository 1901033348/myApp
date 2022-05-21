class ContactsComplete {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  ContactsComplete(
      {required this.id,
      required this.name,
      required this.username,
      required this.email,
      required this.phone,
      required this.website});

  factory ContactsComplete.fromJson(Map<String, dynamic> data) {
    final id = data['id'];
    final name = data['name'];
    final username = data['username'];
    final email = data['email'];
    final phone = data['phone'];
    final website = data['website'];

    return ContactsComplete(
        id: id,
        name: name,
        username: username,
        email: email,
        phone: phone,
        website: website);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
      'email': email,
      'phone': phone,
      'website': website,
    };
  }
}
