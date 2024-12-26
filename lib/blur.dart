import 'package:flutter/material.dart';



class Blur extends StatelessWidget {
  const Blur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Center(
          child:Stack(
  clipBehavior: Clip.none, // Allow shadow to extend beyond bounds
  children: [
    // Second Container
    Positioned(
      top: 50, // Adjust to control overlap
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
    // First Container with Hidden Bottom Border
    Container(
      width: 150,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 40, // Larger blur to blend bottom
            spreadRadius: 15,
            offset: const Offset(0, 20), // Push shadow downward to cover bottom border
          ),
        ],
      ),
    ),
  ],
)

        ),
    );
  }
}
