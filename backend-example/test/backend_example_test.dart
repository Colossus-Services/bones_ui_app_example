import 'package:backend_example/backend_example.dart';
import 'package:bones_api/bones_api_console.dart';
import 'package:test/test.dart';

void main() {
  group('MyAPI', () {
    final api = MyAPI();

    test('base/foo', () async {
      var ret = await api.call(APIRequest.get('base/foo'));
      expect(ret.payload, equals('Hi[GET]!'));
    });
  });
}
