import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = List.generate(
      100,
      (index) => 'https://picsum.photos/id/${index + 100}/300/200',
    );
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.9,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            images[index],
            fit: BoxFit.cover,
            errorBuilder: (c, e, s) {
              return Container(
                color: Colors.grey,
                child: const Icon(Icons.error),
              );
            },
          ),
        );
      },
    );
  }
}
