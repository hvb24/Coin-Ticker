import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:crypto_font_icons/crypto_font_icons.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  List<DropdownMenuItem> getCurrency(){
    List<DropdownMenuItem<String>> dropDownitems =[];
    for(String currency in currenciesList ){


     var newItem = DropdownMenuItem(child: Text(currency),value: currency,);
     dropDownitems.add(newItem);
    }

return dropDownitems;
  }


  List<Text> getPickerList(){

    List<Text> pickerItems = [];

    for(int i=0; i<currenciesList.length; i++ ){


      pickerItems.add(Text(currenciesList[i], style: TextStyle(color: val==i?Colors.white:Colors.black ),));
    }
return pickerItems;

  }
 String bitcoinValueInINR='';
  String dogecoinValueInInr='';
  String ethereumValue='';
  String selectedCurrency='IND';
  int val = 0;

  void getData() async {
    try {
      int data = await CoinData().getDataforBTC(selectedCurrency,val);

      setState(() {
        bitcoinValueInINR = data.toString();

      });
    } catch (e) {
      print(e);
    }
  }

  void getData2() async {
    try {
      double data2 = await CoinData2().getDataforDOGE(selectedCurrency,val);

      setState(() {
        dogecoinValueInInr = data2.toStringAsFixed(2);

      });
    } catch (e) {
      print(e);
    }
  }

  void getData3() async {
    try {
      int data2 = await CoinData3().getDataforETH(selectedCurrency,val);

      setState(() {
        ethereumValue = data2.toString();

      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {

    super.initState();
    getData();
    getData2();
    getData3();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.blueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CryptoFontIcons.BTC,color: Colors.orange,),
                    Text(
                      '1 Bitcoin = $bitcoinValueInINR ${currenciesList[val]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.blueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),

                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CryptoFontIcons.ETC),

                    Text(
                      '1 Ethereum = $ethereumValue ${currenciesList[val]}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],

                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.blueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),

                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CryptoFontIcons.DOGE,color: Colors.yellow),
                    Text(
                      '1 Doge = $dogecoinValueInInr ${currenciesList[val]} £',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 250.0,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.blueAccent,
            child: CupertinoPicker(itemExtent:32.0 ,onSelectedItemChanged: (value){

              setState(() {

                selectedCurrency=currenciesList[value];
                 val = value;
                getData2();
                getData();
                getData3();
              },
              );

            },children: getPickerList(),useMagnifier:true ,
              selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
                background: CupertinoColors.tertiaryLabel,
              ),
            magnification: 1.3,
            looping: true,)
          ),
        ],
      ),
    );
  }
}


//
// DropdownButton<String>(value: selectedCurrency,
// items: getCurrency(),
// onChanged: (value){
// setState(() {
// selectedCurrency=value;
// });
//
// },),