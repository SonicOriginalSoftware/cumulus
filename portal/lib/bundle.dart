import 'package:flutter/services.dart';

class DefaultBundle extends CachingAssetBundle {
  @override
  Future<ByteData> load(String key) async {
    return await rootBundle.load(key);
  }
}
