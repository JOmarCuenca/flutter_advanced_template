import 'package:pmvvm/pmvvm.dart';

class HomeViewModel extends ViewModel {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
