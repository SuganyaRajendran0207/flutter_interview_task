import 'dart:async';

import 'package:flutter/material.dart';

///
/// [BlockableViewModel]
///
abstract class BlockableViewModel extends ChangeNotifier {
  bool _isBlocked = false;
  bool _isDisposed = false;

  ///
  /// Check if the ViewModel is blocked
  ///
  bool get isBlocked => _isBlocked;

  ///
  /// Toggle block state
  ///
  StreamController<String>? toggleBlocking(
      {bool notify = false, bool? block, BuildContext? contextForLoading}) {
    if (block != null) {
      _isBlocked = block;
    } else {
      _isBlocked = !_isBlocked;
    }

    if (notify) {
      notifyListeners();
    }

    return null;
  }

  ///
  /// Execute [callback] and notify after
  ///
  void notifyAfter(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  @override
  void notifyListeners() {
    if (_isDisposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}
