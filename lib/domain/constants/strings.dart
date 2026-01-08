
class ConstantsStrings {
  final appName = 'Clima';
  final appSlug = 'clima';
  final useLocalApiServer = false;

  String get baseUrl {
    const bool isProduction = bool.fromEnvironment('dart.vm.product');

    if (isProduction || !useLocalApiServer) {
      return 'https://todo.vercel.app/api';
    } else {
      return 'http://localhost:3002/api';
    }
  }
}
