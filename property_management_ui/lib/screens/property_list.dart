import 'package:flutter/material.dart';
import 'package:property_management_ui/models/property.dart';
import 'package:property_management_ui/services/local_storage_service.dart';

class PropertyList extends StatefulWidget {
  const PropertyList({Key? key}) : super(key: key);

  @override
  State<PropertyList> createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  late Future<List<Property>> _propertiesFuture;

  @override
  void initState() {
    super.initState();
    _propertiesFuture = LocalStorageService.getProperties();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Property List'),
      ),
      body: FutureBuilder<List<Property>>(
        future: _propertiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            List<Property> properties = snapshot.data!;
            if (properties.isEmpty) {
              return const Center(
                child: Text('No properties added yet'),
              );
            } else {
              return LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 600) {
                    return Row(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            itemCount: (properties.length / 2).ceil(),
                            itemBuilder: (BuildContext context, int index) {
                              return _buildPropertyItem(
                                  context, properties[index]);
                            },
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: (properties.length / 2).ceil(),
                            itemBuilder: (BuildContext context, int index) {
                              return _buildPropertyItem(
                                context,
                                properties[
                                    index + (properties.length / 2).ceil()],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      itemCount: properties.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _buildPropertyItem(context, properties[index]);
                      },
                    );
                  }
                },
              );
            }
          }
        },
      ),
    );
  }

  Widget _buildPropertyItem(BuildContext context, Property property) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth > 600 ? screenWidth / 4 : screenWidth * 0.2;

    return Card(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(
                property.image,
                width: imageWidth,
                height: imageWidth,
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object error,
                    StackTrace? stackTrace) {
                  return Image.network(
                    'https://picsum.photos/300',
                    width: imageWidth,
                    height: imageWidth,
                    fit: BoxFit.cover,
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(property.address),
                ],
              ),
            ),
            Text(property.type),
          ],
        ),
      ),
    );
  }
}
