import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'components/ScanQR.dart';

void main() => runApp(const MaterialApp(home: MyHome()));

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QRViewExample()
    );
  }
}

