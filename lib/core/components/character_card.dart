import 'package:flutter/material.dart';
import 'package:flutter_challenge_rick_morty/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CharacterCard extends StatelessWidget {
  final String imageUrl;
  final String name;

  const CharacterCard({Key? key, required this.imageUrl, required this.name})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12.0)),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              color: AppColors.primaryColorLight,
              child: Text(
                name,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color: AppColors.white,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
