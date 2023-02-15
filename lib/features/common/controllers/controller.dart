import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;
  DateTime _dateTime = DateTime(2023);
  DateTime _dateTime1 = DateTime(2023);
  DateTime _dateTime2 = DateTime(2023);

  int get count => _count;

  DateTime get dataBir => _dateTime;
  DateTime get dataNam => _dateTime1;
  DateTime get dataEh => _dateTime2;

  void increment() {
    _count++;
    notifyListeners();
  }

  void dateTimeChange(DateTime newDate) {
    _dateTime = dataBir;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}
