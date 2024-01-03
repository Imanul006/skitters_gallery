import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skitters_gallery/models/image_model.dart';
import 'package:skitters_gallery/providers/image_provider.dart';
import 'package:skitters_gallery/widgets/image_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<ImageModel>> _imagesFuture;

  @override
  void initState() {
    super.initState();
    final imageProvider = Provider.of<UnsplashImageProvider>(context, listen: false);
    _imagesFuture = imageProvider.fetchImages();
  }

  initial() async {
    
  } 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Skitters Gallery'),
      ),
      body: FutureBuilder<List<ImageModel>>(
        future: _imagesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No images found'));
          }

          final images = snapshot.data!;

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              final image = images[index];
              return ImageCard(photo: image);
            },
          );
        },
      ),
    );
  }
}
