import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String apiKey = '791B3DA0-EF43-4335-959B-DE56769B558E';
  String url = 'https://rest.coinapi.io/v1/exchangerate/BTC/USD';
  Future getCoinData(url) async {
    http.Response response = await http.get(url);
    // Der Status-Code gibt und zurück, ob der request erfolgreich war.
    // Nur bei erfolgreichem request (= Statuscode 2**) returnen wir die
    // empfangenen Daten aus dem request-body in Form eines json-Files.
    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      String responseStatusCode = response.statusCode.toString();
      print('Status Code: $responseStatusCode');
    }
  }
}
