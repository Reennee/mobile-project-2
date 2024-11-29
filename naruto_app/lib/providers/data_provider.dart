import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataProvider with ChangeNotifier {
  List<dynamic> characters = [];
  List<dynamic> clans = [];
  List<dynamic> tailedBeasts = [];

  List<dynamic> get character => characters;
  List<dynamic> get clan => clans;
  List<dynamic> get tailedBeast => tailedBeasts;

  Future<void> fetchCharacters() async {
    const url = 'https://dattebayo-api.onrender.com/characters';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        characters = data['characters']; // Access the list of characters
        notifyListeners();
      } else {
        throw Exception('Failed to load characters');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchClans() async {
    const url = 'https://dattebayo-api.onrender.com/clans';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        clans = data['clans']; // Access the list of clans
        notifyListeners();
      } else {
        throw Exception('Failed to load clans');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> fetchTailedBeasts() async {
    const url = 'https://dattebayo-api.onrender.com/tailed-beasts';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        tailedBeasts =
            data['tailed-beasts']; // Access the list of tailed beasts
        notifyListeners();
      } else {
        throw Exception('Failed to load tailed beasts');
      }
    } catch (error) {
      rethrow;
    }
  }
}
