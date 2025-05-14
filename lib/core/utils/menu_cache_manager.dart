import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MenuCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'menuCache';
  MenuCacheManager()
    : super(Config(key, stalePeriod: const Duration(days: 7), maxNrOfCacheObjects: 200));
}
