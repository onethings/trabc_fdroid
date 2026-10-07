import 'package:flutter_test/flutter_test.dart';
import 'package:trabc_fdroid/constants.dart';

void main() {
  test('AppConstants has an application name', () {
    expect(AppConstants.appName, isNotEmpty);
  });
}
