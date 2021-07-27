import 'package:bones_api/bones_api.dart';

class MyAPI extends APIRoot {
  MyAPI() : super('example', '1.0');

  @override
  Set<APIModule> loadModules() => {MyBaseModule()};
}

class MyBaseModule extends APIModule {
  MyBaseModule() : super('base');

  @override
  String? get defaultRouteName => '404';

  @override
  void configure() {
    routes.get('foo', (request) => APIResponse.ok('Hi[GET]!'));
    routes.post(
        'foo', (request) => APIResponse.ok('Hi[POST]! ${request.parameters}'));

    routes.any('time', (request) => APIResponse.ok(DateTime.now(), mimeType: 'text/plain'));

    routes.any('404',
        (request) => APIResponse.notFound(payload: '404: ${request.path}'));

    routes.any('err',
            (request) => APIResponse.error(error: 'ERROR!'));
  }
}
