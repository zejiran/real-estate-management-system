import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:property_management_ui/models/property.dart';

class LocalStorageService {
  static const String _propertiesKey = 'properties';

  static Future<List<Property>> getProperties() async {
    final prefs = await SharedPreferences.getInstance();
    final propertiesJson = prefs.getString(_propertiesKey);
    if (propertiesJson != null) {
      Iterable list = json.decode(propertiesJson);
      return list.map((model) => Property.fromJson(model)).toList();
    }
    return [];
  }

  static Future<void> saveProperty(Property property) async {
    final prefs = await SharedPreferences.getInstance();
    List<Property> properties = await getProperties();
    properties.add(property);
    await prefs.setString(_propertiesKey, json.encode(properties));
  }
}
