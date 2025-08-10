import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_challenge_rick_morty/core/components/app_bar_widget.dart';
import 'package:flutter_challenge_rick_morty/core/components/character_card.dart';
import 'package:flutter_challenge_rick_morty/theme/app_colors.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  ListPageState createState() => ListPageState();
}

class ListPageState extends State<ListPage> {
  Future<Response>? response;
  final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

  @override
  initState() {
    response = dio.get('/character');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(leftIcon: Icon(Icons.menu, color: AppColors.white)),
      backgroundColor: AppColors.black,
      body: FutureBuilder(
        future: response,
        builder: (context, AsyncSnapshot<Response> snapshot) {
          if (snapshot.hasData) {
            final Map<String, dynamic> data = snapshot.data!.data;
            final characters = data['results'] as List<dynamic>;

            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 4.0,
                    horizontal: 8.0,
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.of(context).pushNamed(
                        '/details',
                        arguments: characters[index]["id"],
                      ),
                    },
                    child: CharacterCard(
                      imageUrl: characters[index]['image'],
                      name: characters[index]['name'],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
