import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mandarin_to_latin/mandarin_to_latin.dart';

void main() {
  const MethodChannel channel = MethodChannel('mandarin_to_latin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return 'zhōng wén';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('mandarinToLatin', () async {
    expect(await MandarinToLatin.mandarinToLatin('中文'), 'zhōng wén');
  });
}
