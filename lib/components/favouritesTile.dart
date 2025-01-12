import 'package:flutter/material.dart';
import 'package:foodie/models/productDetails.dart';

class FavouritesTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String authorName;
  final String authorAvatarUrl;
  final String description;

  const FavouritesTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.authorName,
    required this.authorAvatarUrl,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => 
            ProductDetailPage(title: title, imageUrl: imageUrl, description: description)
          ));
        },
        child: Card(        
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(        
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [            
              Stack(
                children: [                
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 120,
                          color: Colors.grey[200],
                          child: const Icon(Icons.error),
                        );
                      },
                    ),
                  ),                
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Image.asset(
                      'assets/favourite_coloured_icon.png',
                      width: 60,
                      height: 60,
                    ),
                  ),
                ],
              ),            
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: AssetImage(authorAvatarUrl),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            authorName,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}