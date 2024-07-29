import 'dart:convert';
import 'package:http/http.dart';

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

const coinurl = 'https://rest.coinapi.io/v1/exchangerate';
const apikey = 'A96743E5-EC8A-42D7-B92E-1209426027A8';

class CoinData {
  //Create the Asynchronous method getCoinData() that returns a Future (the price data).
  Future getCoinData(String currentCurrency) async {
    //create a map to store crypto and its rate.
    Map<String, String> cryptoPrice = {};
    //loop for all cryptos
    for (String crypto in cryptoList) {
      // Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
      String url = '$coinurl/$crypto/$currentCurrency?apikey=$apikey';
      //Make a GET request to the URL and wait for the response.
      Response response = await get(
        Uri.parse(url),
      );
      //Check that the request was successful.
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        //get rate
        double price = data['rate'];
        cryptoPrice[crypto] = price.toStringAsFixed(4);
      } else {
        // Handle any errors that occur during the request.
        print(response.statusCode);
        //Optional: throw an error if our request fails.
        throw 'Try again later...';
      }
    }
    return cryptoPrice;
  }
}
