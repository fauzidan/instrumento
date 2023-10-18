import 'package:flutter/material.dart';

class CatalogPageHeader extends StatelessWidget {
  const CatalogPageHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          colors: [Color.fromARGB(255, 47, 44, 41), Color.fromARGB(255, 131, 123, 114), Color.fromARGB(255, 141, 127, 107)],
          radius: 5
        ),
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Selamat Datang!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Kami menghadirkan gitar dengan kualitas terbaik yang dapat membantu anda menghasilkan musik yang fenomenal.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
