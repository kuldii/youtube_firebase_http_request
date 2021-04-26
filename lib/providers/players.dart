import 'package:flutter/material.dart';
import '../models/player.dart';

class Players with ChangeNotifier {
  List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  void addPlayer(
      String name, String position, String image, BuildContext context) {
    DateTime datetimeNow = DateTime.now();
    _allPlayer.add(
      Player(
        id: datetimeNow.toString(),
        name: name,
        position: position,
        imageUrl: image,
        createdAt: datetimeNow,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil ditambahkan"),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  void editPlayer(String id, String name, String position, String image,
      BuildContext context) {
    Player selectPlayer = _allPlayer.firstWhere((element) => element.id == id);
    selectPlayer.name = name;
    selectPlayer.position = position;
    selectPlayer.imageUrl = image;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil diubah"),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  void deletePlayer(String id, BuildContext context) {
    _allPlayer.removeWhere((element) => element.id == id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil dihapus"),
        duration: Duration(milliseconds: 500),
      ),
    );
    notifyListeners();
  }
}
