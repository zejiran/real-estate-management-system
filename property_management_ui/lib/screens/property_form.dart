import 'package:flutter/material.dart';
import 'package:property_management_ui/models/property.dart';
import 'package:property_management_ui/services/local_storage_service.dart';

class PropertyForm extends StatefulWidget {
  const PropertyForm({Key? key}) : super(key: key);

  @override
  State<PropertyForm> createState() => _PropertyFormState();
}

class _PropertyFormState extends State<PropertyForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _addressController = TextEditingController();
  final _typeController = TextEditingController();
  final _imageController = TextEditingController();

  void _saveProperty() {
    if (_formKey.currentState!.validate()) {
      Property newProperty = Property(
        name: _nameController.text,
        address: _addressController.text,
        type: _typeController.text,
        image: _imageController.text,
      );
      LocalStorageService.saveProperty(newProperty);
      _nameController.clear();
      _addressController.clear();
      _typeController.clear();
      _imageController.clear();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Property saved')));
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.2; // 20% of the screen width

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Property'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration:
                        const InputDecoration(labelText: 'Property Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the property name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(labelText: 'Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the property address';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _typeController,
                    decoration:
                        const InputDecoration(labelText: 'Property Type'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the property type';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _imageController,
                    decoration: const InputDecoration(labelText: 'Image URL'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the image URL';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _saveProperty,
                    icon: const Icon(Icons.save),
                    label: const Text('Save Property'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Background color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(16.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
