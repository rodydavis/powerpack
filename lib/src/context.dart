import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Future<T> show<T>(Widget child, {NavType type = NavType.push}) {
    switch (type) {
      case NavType.fullScreen:
        return Navigator.of(this).push<T>(MaterialPageRoute(
          builder: (_) => child,
          fullscreenDialog: true,
        ));
      case NavType.push:
        return Navigator.of(this).push<T>(MaterialPageRoute(
          builder: (_) => child,
          fullscreenDialog: false,
        ));
      case NavType.popUp:
        return showDialog<T>(
          context: this,
          builder: (_) => AlertDialog(content: child),
        );
    }
    return null;
  }
}

enum NavType { push, fullScreen, popUp }
