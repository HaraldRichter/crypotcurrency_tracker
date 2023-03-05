import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'EUR';

  /// Funktion, mit der die Liste der Items für den Echtgeld-Dropdown-Picker erstellt wird:
  List<DropdownMenuItem<String>> getDropdownItems() {
    // First we create an empty List:
    List<DropdownMenuItem<String>> dropdownItems = [];

    // Anschließend erstellen wir ein Item für jeden Eintrag in der Liste,
    // die als "Vorlage" dient (hier also die 'currenciesList').
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        value: currency,
        child: Text(currency),
      );
      // Das erstellte Item wird der leeren Liste 'dropdownItems' hinzugefügt:
      dropdownItems.add(newItem);
    }
    // ... und schließlich zurückgegeben:
    return dropdownItems;
  }

  /// Funktion, mit der die Liste für den Echtgeld-Cupertino-Picker erstellt wird:
  List<Widget> getPickerItems() {
    List<Widget> pickerItems = [];
    for (String currency in currenciesList) {
      var newItem = Text(currency);
      pickerItems.add(newItem);
    }
    return pickerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.black87,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.black87,
            child: CupertinoPicker(
              itemExtent: 30.0,
              onSelectedItemChanged: (selectedIndex) {
                print(selectedIndex);
              },
              children: getPickerItems(),
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButton<String>(
// value: selectedCurrency, // Wert, der angezeigt wird
// items: getDropdownItems(),
// onChanged: (value) {
// setState(() {
// selectedCurrency = value!;
// });
// print(value);
// },
