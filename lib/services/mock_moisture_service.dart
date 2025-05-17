import 'dart:async';
import 'dart:math';
import 'package:flutter/foundation.dart';

class MockMoistureService extends ChangeNotifier {
  final Random _random = Random();
  Timer? _timer;
  int _currentValue = 50; // Start at a middle value

  int get currentValue => _currentValue;

  void startGenerating() {
    _timer?.cancel(); // Cancel existing timer if any
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      _currentValue = _random.nextInt(101); // 0 to 100
      notifyListeners(); // Update UI
    });
  }

  void stopGenerating() {
    _timer?.cancel();
    _timer = null;
  }

  Future<double> getMoistureLevel() async {
    await Future.delayed(Duration(milliseconds: 500)); // simulate delay
    return _currentValue.toDouble();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
