import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BlogPostsLoadingView extends StatelessWidget {
  const BlogPostsLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        itemBuilder: (context, index) => Column(
          children: [
            Container(
              color: Colors.white,
              height: 150,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
        itemCount: 5,
      ),
    );
  }
}
