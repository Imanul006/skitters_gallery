import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skitters_gallery/models/image_model.dart';
import 'package:skitters_gallery/providers/image_provider.dart';

class DetailsScreen extends StatelessWidget {
  final ImageModel image;

  const DetailsScreen({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final unsplashProvider = Provider.of<UnsplashImageProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(image.altDescription ?? 'Image Details'),
  
      ),
      floatingActionButton: unsplashProvider.isLoading ? const CircularProgressIndicator() : FloatingActionButton(
        onPressed: () async {
          String message = await unsplashProvider.downloadImage(image.urls.full, 'image_${image.id}.jpg');
          if(context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          );
          }
        },
       
        child: const Icon(Icons.download),
      ),
    
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image.urls.regular,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    image.description ?? 'No description available',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Icon(Icons.thumb_up, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text('${image.likes} Likes', style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Uploaded by:',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(image.user.profileImage.small),
                      ),
                      const SizedBox(width: 10),
                      Text(image.user.name, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
