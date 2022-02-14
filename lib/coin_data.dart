import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:binance/binance.dart';
import 'price_screen.dart';




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
  'INR ',
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

const List<String> currenciesListforLink = [
  'aud',
  'brl',
  'cad',
  'cny',
  'eur',
  'gbp',
  'hkd',
  'idr',
  'ils',
  'inr',
  'jpy',
  'mxn',
  'nok',
  'nzd',
  'pln',
  'ron',
  'rub',
  'sek',
  'sgd',
  'usd',
  'zar'
];
// const List<String> currencySymbol = [
//   '$'
// ];

const List<String> cryptoList = [
  'bitcoin',
  'dogecoin',
  'LTC',
];

class CoinData {

//RUNNING NICELY



  Future<dynamic> getDataforBTC(String selectedCurrrency, int val) async {
    String curr = currenciesListforLink[val];
    var url = 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=$selectedCurrrency';
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {

      var decodedData = jsonDecode(response.body);

      var lastPrice = decodedData['bitcoin']['$curr'] ;

      return lastPrice;
    } else {

      print(response.statusCode);

      throw 'Problem with the get request';
    }
  }

}

class CoinData2 {



  Future<dynamic> getDataforDOGE(String selectedCurrrency, int val) async {
    String curr2 = currenciesListforLink[val];
    var url = 'https://api.coingecko.com/api/v3/simple/price?ids=dogecoin&vs_currencies=$selectedCurrrency';
    http.Response response = await http.get(Uri.parse(url));


    if (response.statusCode == 200) {

      var decodedData = jsonDecode(response.body);

      var lastPrice = decodedData['dogecoin']['$curr2'];

      return lastPrice;
    } else {

      print(response.statusCode);

      throw 'Problem with the get request';
    }
  }


}

class CoinData3 {



  Future<dynamic> getDataforETH(String selectedCurrrency, int val) async {
    String curr3 = currenciesListforLink[val];
    var url = 'https://api.coingecko.com/api/v3/simple/price?ids=ethereum&vs_currencies=$selectedCurrrency';
    http.Response response = await http.get(Uri.parse(url));


    if (response.statusCode == 200) {

      var decodedData = jsonDecode(response.body);

      var lastPrice = decodedData['ethereum']['$curr3'];

      return lastPrice;
    } else {

      print(response.statusCode);

      throw 'Problem with the get request';
    }
  }


}


// String data = response.body;
// var rate = await jsonDecode(data)['rate'];
// print(rate);
// print(response.statusCode);
// return rate;