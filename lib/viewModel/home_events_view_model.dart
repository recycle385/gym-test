import 'package:flutter/material.dart';
import '../model/home_events_card_model.dart';
import '../repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _repository = HomeRepository();
  List<HomeEvent> _events = [];

  List<HomeEvent> get events => _events;

  Future<void> loadEvents() async {
    _events = await _repository.fetchHomeEvents();
    notifyListeners(); // UI 업데이트
  }
}
