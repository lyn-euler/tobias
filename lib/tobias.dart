import 'dart:async';
import 'package:flutter/services.dart';

final MethodChannel _channel = const MethodChannel('com.jarvanmo/tobias');

/// [evn] only supports Android due to native AliPaySDK
Future<Map> aliPay(String order, {AliPayEvn evn = AliPayEvn.ONLINE}) async {
  return await _channel
      .invokeMethod("pay", {"order": order, "payEnv": evn.index});
}

Future<Map> aliPayAuth(String auth) async {
  return await _channel.invokeMethod("auth", auth);
}

Future<String> aliPayVersion() async {
  return await _channel.invokeMethod("version");
}

Future<bool> isAliPayInstalled() async {
  return await _channel.invokeMethod("isAliPayInstalled");
}

Future<Map> deduct({String signParams, String scheme}) async {
  return await _channel.invokeMethod("deduct", {"signParams": signParams, "scheme": scheme});
}

enum AliPayEvn { ONLINE, SANDBOX }
