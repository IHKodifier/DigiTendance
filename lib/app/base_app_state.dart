import 'package:flutter/cupertino.dart';

@immutable
class AppStateBase {
  bool _isBusy = false;

  bool get isBusy => _isBusy == true;
  bool get isNotBusy => _isBusy == false;

 void  getBusy() {
    _isBusy = true;
  }

  void getIdle() {
    _isBusy = false;
  }
}
