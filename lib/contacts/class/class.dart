class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final LatLng geo;
  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
      required this.geo});

  factory Address.fromJson(Map<String, dynamic> data) {
    final street = data['street'];
    final suite = data['suite'];
    final city = data['city'];
    final zipcode = data['zipcode'];
    final geo = data['geo'];

    return Address(
        street: street, suite: suite, city: city, zipcode: zipcode, geo: geo);
  }

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'suite': suite,
      'city': city,
      'zipcode': zipcode,
      'geo': geo,
    };
  }
}

class LatLng {
  double lat = 0;
  double lng = 0;
  LatLng(this.lat, this.lng);
}

class Company {
  String name = '';
  String catchPhrase = '';
  String bs = '';
  Company(this.name, this.catchPhrase, this.bs);
}
