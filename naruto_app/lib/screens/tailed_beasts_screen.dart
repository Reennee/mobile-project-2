import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';

class TailedBeastsScreen extends StatelessWidget {
  const TailedBeastsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tailed Beasts'),
      ),
      body: FutureBuilder(
        future: dataProvider.fetchTailedBeasts(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final tailedBeasts = dataProvider.tailedBeasts;
            return ListView.builder(
              itemCount: tailedBeasts.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(tailedBeasts[index]['name']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
