import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  List<String> _words = [];
  List<String> get words => _words;

  void toggleFavorite(String namaGame) {
    final isExist = _words.contains(namaGame);
    if (isExist) {
      _words.remove(namaGame);
    } else {
      _words.add(namaGame);
    }
    notifyListeners();
  }

  bool isExist(String namaGame) {
    final isExist = _words.contains(namaGame);
    return isExist;
  }

  void clearFavorite() {
    _words = [];
    notifyListeners();
  }

  static FavoriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
