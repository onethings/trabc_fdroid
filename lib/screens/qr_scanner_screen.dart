// lib/screens/qr_scanner_screen.dart
// A screen that allows users to scan a QR code to get the server URL.

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  // Guard against reporting more than one code before the route is popped.
  bool _handled = false;

  void _onScan(Code code) {
    if (_handled) return;
    final String? value = code.text;
    if (value == null || value.isEmpty) return;
    _handled = true;
    Navigator.of(context).pop(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(middle: const Text('Scan Server URL')),
      body: ReaderWidget(codeFormat: Format.qrCode, showGallery: false, onScan: _onScan, onScanFailure: (_) {}),
    );
  }
}
