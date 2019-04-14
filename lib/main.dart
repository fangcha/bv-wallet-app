import 'package:flutter/material.dart';

import 'home.dart';
import 'theme.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BoardVille Wallet',
      theme: theme,
      home: Home(),
    );
  }
}
