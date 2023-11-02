import 'package:flutter_test/flutter_test.dart';
import 'package:property_management_ui/models/property.dart';

void main() {
  group('Property Model Tests', () {
    test('Property should initialize with the correct values', () {
      final property = Property(
        name: 'Sample Property',
        address: '123 Main Street',
        type: 'Apartment',
        image: 'https://example.com/sample_image.jpg',
      );

      expect(property.name, 'Sample Property');
      expect(property.address, '123 Main Street');
      expect(property.type, 'Apartment');
      expect(property.image, 'https://example.com/sample_image.jpg');
    });

    test('Property should not be null', () {
      final property = Property(
        name: 'Sample Property',
        address: '123 Main Street',
        type: 'Apartment',
        image: 'https://example.com/sample_image.jpg',
      );

      expect(property, isNotNull);
    });

    test('Property fromJson method should return the correct Property object',
        () {
      final Map<String, dynamic> json = {
        'name': 'Sample Property',
        'address': '123 Main Street',
        'type': 'Apartment',
        'image': 'https://example.com/sample_image.jpg',
      };

      final property = Property.fromJson(json);

      expect(property.name, 'Sample Property');
      expect(property.address, '123 Main Street');
      expect(property.type, 'Apartment');
      expect(property.image, 'https://example.com/sample_image.jpg');
    });

    test('Property toJson method should return the correct JSON map', () {
      final property = Property(
        name: 'Sample Property',
        address: '123 Main Street',
        type: 'Apartment',
        image: 'https://example.com/sample_image.jpg',
      );

      final json = property.toJson();

      expect(json['name'], 'Sample Property');
      expect(json['address'], '123 Main Street');
      expect(json['type'], 'Apartment');
      expect(json['image'], 'https://example.com/sample_image.jpg');
    });
  });
}
