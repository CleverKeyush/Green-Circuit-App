import 'package:flutter/material.dart';

class Community extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Waste Community',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CommunityPage(),
    );
  }
}

class CommunityPage extends StatelessWidget {
  final List<Map<String, dynamic>> _eWasteImages = [
    {
      'imagePath': 'assets/images/e-waste1.jpg',
      'comment':
          'I took my old phone to an e-waste recycling center where they properly disposed of it, ensuring its components were recycled or disposed of safely. It felt good knowing I was contributing to reducing electronic waste.'
    },
    {
      'imagePath': 'assets/images/e-waste2.jpg',
      'comment':
          'I recently recycled my old laptop by taking it to an e-waste collection event in my community. It felt great knowing I was disposing of it responsibly and helping the environment.'
    },
    // Add more images and comments as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('E-Waste Community'),
        backgroundColor: Colors.green, // Change app bar color to green
      ),
      body: ListView.builder(
        itemCount: _eWasteImages.length,
        itemBuilder: (context, index) {
          return _buildImageWithComment(_eWasteImages[index]['imagePath'],
              _eWasteImages[index]['comment']);
        },
      ),
    );
  }

  Widget _buildImageWithComment(String imagePath, String comment) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Give shape to the image
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16), // Adding space between the image and the text
          Text(
            comment,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
