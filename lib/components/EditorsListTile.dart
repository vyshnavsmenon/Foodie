import 'package:flutter/material.dart';
import 'package:foodie/components/TextStyle.dart';
import 'package:foodie/models/productDetails.dart';

class EditorsListTile extends StatelessWidget {
  final String title;
  final String imageUrl;  
  final String description;
  final VoidCallback? onTap;

  const EditorsListTile({
    Key? key,
    required this.title,
    required this.imageUrl,    
    required this.description,
    this.onTap, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        child: Card(
          elevation: 2,        
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => 
                ProductDetailPage(title: title, imageUrl: imageUrl, description: description)
              ));              
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [                
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      imageUrl,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 60,
                          height: 60,
                          color: Colors.grey[200],
                          child: const Icon(Icons.error_outline),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyles.getTextStyle(16, FontWeight.w600, Colors.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            ClipRRect(                              
                              child: Image.asset(
                                'assets/Person.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'James Spader',
                              style: TextStyles.getTextStyle(14, FontWeight.w400, Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),                  
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: const Color(0xFF042628),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );  
  }
}