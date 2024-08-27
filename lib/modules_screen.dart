import 'package:flutter/material.dart';

class ModulesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> modules = [
    {'name': 'Vicar Message', 'icon': Icons.message},
    {'name': 'Bishop and Vicar Details', 'icon': Icons.person},
    {'name': 'Reading Verses', 'icon': Icons.book},
    {'name': 'Organization', 'icon': Icons.group},
    {'name': 'Publication', 'icon': Icons.public},
    {'name': 'Parish Directory', 'icon': Icons.contacts},
    {'name': 'Bible & Worship Order', 'icon': Icons.library_books},
    {'name': 'Announcement', 'icon': Icons.announcement},
    {'name': 'Office Bearer', 'icon': Icons.admin_panel_settings},
    {'name': 'Gallery', 'icon': Icons.photo_album},
    {'name': 'Community', 'icon': Icons.forum},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: modules.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Navigate to the respective module page
              },
              child: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      modules[index]['icon'],
                      size: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 10),
                    Text(
                      modules[index]['name'],
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
