import 'dart:math';
import 'dart:io' show Platform;
//show - only this
//hide - except this everything
//as - rename
import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String currentCurrency = 'INR';

  //picker for ios
  CupertinoPicker iosPickerItems() {
    List<Text> pickerItems = [];
    for (String s in currenciesList) {
      pickerItems.add(Text(s));
    }
    return CupertinoPicker(
      itemExtent: 42,
      onSelectedItemChanged: (value) {
        currentCurrency = pickerItems[value - 1] as String;
        getData();
      },
      children: pickerItems,
    );
  }

  //dropdown button android
  DropdownButton<String> androidDropDownButton() {
    List<DropdownMenuItem<String>> itemList = [];
    for (String s in currenciesList) {
      var newItem = DropdownMenuItem(child: Text(s), value: s);
      itemList.add(newItem);
    }
    return DropdownButton<String>(
      value: currentCurrency,
      items: itemList,
      onChanged: (value) {
        setState(
          () {
            currentCurrency = value.toString();
            getData();
          },
        );
      },
    );
  }

  Map<String, String> coinValues = {};
  bool questionMark = false;

  void getData() async {
    questionMark = true;
    try {
      var data = await CoinData().getCoinData(currentCurrency);
      questionMark = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          '🤑 Coin Ticker',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CryptoCard(
                  value: 'BTC',
                  selectedCurrency:
                      questionMark ? '?' : coinValues['BTC'].toString(),
                  cryptoCurrency: currentCurrency),
              CryptoCard(
                  value: 'ETH',
                  selectedCurrency:
                      questionMark ? '?' : coinValues['ETH'].toString(),
                  cryptoCurrency: currentCurrency),
              CryptoCard(
                value: 'LTC',
                selectedCurrency:
                    questionMark ? '?' : coinValues['LTC'].toString(),
                cryptoCurrency: currentCurrency,
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isAndroid
                ? androidDropDownButton()
                : iosPickerItems(), //check if platform is ios or android
          ),
        ],
      ),
    );
  }
}

//style of cryptocard
class CryptoCard extends StatelessWidget {
  //2: You'll need to able to pass the selectedCurrency, value and cryptoCurrency to the constructor of this CryptoCard Widget.
  const CryptoCard({
    required this.value,
    required this.selectedCurrency,
    required this.cryptoCurrency,
  });

  final String value;
  final String selectedCurrency;
  final String cryptoCurrency;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $value = $selectedCurrency $cryptoCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
