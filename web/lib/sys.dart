import 'package:async_field/async_field.dart';
import 'package:bones_ui/bones_ui_kit.dart';

final AppSys SYS = AppSys();

class AppSys {
  static bool get isDevelopment => isUriBaseLocalhost();

  static String get baseURL => isDevelopment
      ? 'http://localhost:8080/api'
      : 'https://your.app.domain/api/v1';

  static final HttpClient client = HttpClient(baseURL)
    ..autoChangeAuthorizationToBearerToken('Access-Token');

  static final AsyncStorage asyncStorage = AsyncStorage();

  final AsyncField<User> loggedUser = asyncStorage.getField('loggedUser');

  bool get isLogged => loggedUser.isSet;

  final AsyncField<double> btcUsd = asyncStorage.getField<double>('btc_usd');

  AppSys() {
    btcUsd
      ..withFetcher((f) => fetchBtcUsd())
      ..timeout = Duration(minutes: 2)
      ..periodicRefresh = Duration(seconds: 30);
  }

  Future<User?> doLogin(String username, String password) async {
    var response = await client.post(
      'login',
      authorization: BasicCredential(username, password),
    );

    if (response.isNotOK) {
      return null;
    }

    var user = User.fromJson(response.json);
    loggedUser.set(user);

    return user;
  }

  Future<User?> register(String name, String username, String email, String password) async {
    var response = await client.post('register');

    if (response.isNotOK) {
      return null;
    }

    var user = User.fromJson(response.json);
    loggedUser.set(user);

    return user;
  }

  /// Function that fetches the BTS-USD price.
  Future<double> fetchBtcUsd() async {
    print('FETCH BTC USD...');
    var response = await HttpClient('https://api.coindesk.com/v1')
        .get('bpi/currentprice.json');

    if (response.isNotOK) return -1;

    var rate = response.json['bpi']['USD']['rate_float'];
    print('FETCH BTC USD: $rate');

    return double.parse('$rate');
  }

}

class User {
  final int id;
  final String email;
  final String? name;

  User({required this.id, required this.email, this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'id': id,
        if (name != null) 'name': name,
      };
}
