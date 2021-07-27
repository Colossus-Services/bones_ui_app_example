import 'package:backend_example/backend_example.dart';
import 'package:bones_api/bones_api_server.dart';

void main(List<String> args) async {
  var api = MyAPI();

  var apiServer = await APIServer.run(api, args, verbose: true);

  await apiServer.waitStopped();
}
