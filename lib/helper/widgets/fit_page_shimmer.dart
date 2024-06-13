import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class FitPageShimmer extends StatelessWidget {
  const FitPageShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Number of items to display
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!, // Light grey color as the base color
          highlightColor: Colors.grey[100]!, // Slightly lighter grey as the highlight
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
            title: Container(
              height: 10,
              width: double.infinity,
              color: Colors.white,
            ),
            subtitle: Container(
              height: 10,
              width: double.infinity,
              margin: const EdgeInsets.only(top: 5),
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
