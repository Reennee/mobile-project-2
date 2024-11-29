import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_provider.dart';

class ClansScreen extends StatefulWidget {
  const ClansScreen({super.key});
  @override
  ClansScreenState createState() => ClansScreenState();
}

class ClansScreenState extends State<ClansScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch clans when the screen is initialized
    Provider.of<DataProvider>(context, listen: false).fetchClans();
  }

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clans'),
      ),
      body: FutureBuilder(
        future: dataProvider.fetchClans(), // Ensure this is called only once
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final clans = dataProvider.clans; // Access the clans data
            return ListView.builder(
              itemCount: clans.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(clans[index]['name']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
