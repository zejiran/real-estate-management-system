class Property {
  String name;
  String address;
  String type;
  String image;

  Property({
    required this.name,
    required this.address,
    required this.type,
    required this.image,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      name: json['name'] as String,
      address: json['address'] as String,
      type: json['type'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'type': type,
      'image': image,
    };
  }
}
