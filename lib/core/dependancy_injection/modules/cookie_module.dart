import 'package:cookie_jar/cookie_jar.dart';
import 'package:dev_test/main.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:injectable/injectable.dart';

final dirPath = appDirectory.path;
final persistCookieJar = PersistCookieJar(
  ignoreExpires: true,
  storage: FileStorage(dirPath),
);

@module
abstract class CookieModule {
  @lazySingleton
  CookieManager get cookieManager {
    return CookieManager(persistCookieJar);
  }
}
