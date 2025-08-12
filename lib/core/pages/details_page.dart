import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_rick_morty/core/components/app_bar_widget.dart';
import 'package:flutter_challenge_rick_morty/theme/app_colors.dart';
import 'package:flutter_challenge_rick_morty/core/components/details_card.dart';

class DetailsPage extends StatefulWidget {
  final int id;

  const DetailsPage({super.key, required this.id});

  @override
  DetailsPageState createState() => DetailsPageState();
}

class DetailsPageState extends State<DetailsPage> {
  Future<Response>? response;
  final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  @override
  initState() {
    response = dio.get('/character/${widget.id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBarWidget(leftIcon: Icon(Icons.menu, color: AppColors.white)),
      body: FutureBuilder(
        future: response,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final Map<String, dynamic> data = snapshot.data!.data;

            final String name = data['name'] ?? 'Unknown';
            final String gender = data['gender'] ?? 'Unknown';
            final String imageUrl = data['image'] ?? '';
            final String lastKnownLocation =
                data['location']['name'] ?? 'Unknown';
            final String firstSeenIn = data['origin']['name'] ?? 'Unknown';
            final String status = data['status'] ?? 'Unknown';
            final String specie = data['species'] ?? 'Unknown';

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    DetailsCard(
                      imageUrl: imageUrl,
                      name: name,
                      gender: gender,
                      lastKnowLocation: lastKnownLocation,
                      firstSeenIn: firstSeenIn,
                      status: status,
                      specie: specie,
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
