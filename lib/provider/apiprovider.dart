import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/qouets.dart';


class QuotesProvider with ChangeNotifier {
  List<Quote> _quotes = [];
  List<Map<String, dynamic>> _likedQuotes = [];

  List<Quote> get quotes => _quotes;
  List<Map<String, dynamic>> get likedQuotes => _likedQuotes;

  int _page = 1;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchQuotes() async {
    if (_isLoading) return;

    _isLoading = true;
    notifyListeners();

    final url = Uri.parse('http://api.quotable.io/quotes?page=$_page');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final fetchedQuotes = data['results']
            .map<Quote>((json) => Quote.fromJson(json))
            .toList();
        _quotes.addAll(fetchedQuotes);
        _page++;
      }
    } catch (e) {
      print('Error fetching quotes: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> likeQuote(Quote quote) async {
    final prefs = await SharedPreferences.getInstance();
    final dateTime = DateTime.now().toIso8601String();
    final likedQuote = {'id': quote.id, 'content': quote.content, 'author': quote.author, 'likedAt': dateTime};

    _likedQuotes.add(likedQuote);
    prefs.setStringList('likedQuotes', _likedQuotes.map(json.encode).toList());
    notifyListeners();
  }

  Future<void> loadLikedQuotes() async {
    final prefs = await SharedPreferences.getInstance();
    final storedQuotes = prefs.getStringList('likedQuotes') ?? [];
    _likedQuotes = storedQuotes.map((q) => json.decode(q)).cast<Map<String, dynamic>>().toList();
    notifyListeners();
  }

  Future<void> removeLikedQuote(String id) async {
    final prefs = await SharedPreferences.getInstance();
    _likedQuotes.removeWhere((q) => q['id'] == id);
    prefs.setStringList('likedQuotes', _likedQuotes.map(json.encode).toList());
    notifyListeners();
  }
}