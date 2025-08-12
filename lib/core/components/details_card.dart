import 'package:flutter/material.dart';
import 'package:flutter_challenge_rick_morty/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String gender;
  final String lastKnowLocation;
  final String firstSeenIn;
  final String status;
  final String specie;

  const DetailsCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.gender,
    required this.lastKnowLocation,
    required this.firstSeenIn,
    required this.status,
    required this.specie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      clipBehavior: Clip.hardEdge,
      elevation: 5,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            color: AppColors.primaryColorLight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  name,
                  style: GoogleFonts.lato(
                    fontSize: 18,
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      child: Container(
                        height: 8,
                        width: 8,
                        color: status == "Dead"
                            ? AppColors.red
                            : AppColors.green,
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${status} - ${specie}',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Last Know Location',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 4),
                Text(
                  lastKnowLocation,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 16),
                Text(
                  'First Seen in:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 4),
                Text(
                  firstSeenIn,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    height: 1,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Gender:',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: AppColors.white,
                    height: 1,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 4),
                Text(
                  gender,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
