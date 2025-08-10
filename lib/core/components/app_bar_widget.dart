import 'package:flutter/material.dart';
import 'package:flutter_challenge_rick_morty/theme/app_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key, required this.leftIcon}) : super(key: key);

  final Widget leftIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBarColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leftIcon,
              Expanded(
                child: Column(
                  children: [
                    Image.asset('assets/logo.png'),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        'RICK AND MORTY API',
                        style: TextStyle(color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.person, color: AppColors.white),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(135);
}
