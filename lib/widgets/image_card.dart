import 'package:flutter/material.dart';
import 'package:skitters_gallery/models/image_model.dart';
import 'package:skitters_gallery/screens/details_screen.dart';

class ImageCard extends StatelessWidget {
  final ImageModel photo;

  const ImageCard({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsScreen(image: photo),));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Image.network(
                photo.urls.small,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    photo.description ?? (photo.altDescription ?? 'No Description'),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text('${photo.likes} Likes'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
