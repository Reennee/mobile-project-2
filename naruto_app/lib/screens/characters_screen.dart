import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final dataProvider = DataProvider();

  @override
  void initState() {
    super.initState();
    dataProvider.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
      ),
      body: FutureBuilder(
        future: dataProvider.fetchCharacters(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final characters = dataProvider.characters;
            return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (ctx, index) {
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(characters[index]['name']),
                    leading: Image.network(
                      characters[index]['images'][0], // Display the first image
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Jutsu: ${characters[index]['jutsu'].join(', ')}'),
                        Text(
                            'Family: ${formatFamily(characters[index]['family'])}'),
                        Text(
                            'Rank: ${characters[index]['rank']['ninjaRank']['Part I']}'),
                        Text(
                            'Age: ${characters[index]['personal']['age']['Part I']}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  String formatFamily(Map<String, dynamic> family) {
    return family.entries
        .map((entry) => '${entry.key}: ${entry.value}')
        .join(', ');
  }
}
