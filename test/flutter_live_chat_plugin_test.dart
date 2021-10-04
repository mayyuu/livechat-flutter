import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_live_chat_plugin/flutter_live_chat_plugin.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_live_chat_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterLiveChatPlugin.platformVersion, '42');
  });
}
