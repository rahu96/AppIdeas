import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bin2Dec',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePageState createState() => HomePageState();
}

String binstring = "";
String decstring = "";

class HomePageState extends State<HomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bin2Dec'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        children: <Widget>[
          BinBody(),
          Decbody(),
          Container(
            height: 200,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        binstring += '0';
                      });
                    },
                    child: Text('0'),
                  ),
                ),
                Container(
                  width: 40,
                ),
                Expanded(
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        binstring += '1';
                      });
                    },
                    child: Text('1'),
                  ),
                ),
                Container(
                  width: 40,
                ),
                RaisedButton(
                  onPressed: () {
                    setState(() {
                      if(binstring.length>0)
                      {
                        binstring = binstring.substring(0,binstring.length-1);
                      }
                    });
                  },
                  child: Text('<'),
                )
              ],
            ),
          ),
          Container(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                decstring = convertion();
              });
            },
            child: Text('Convert'),
          )
        ],
      ),
    );
  }
}
String convertion() {

 String num = binstring;
 int decvalue = 0;
 int base = 1;
 int len = num.length;
 for(int i=len-1;i>=0;i--) {
   if(num[i] == '1')
    {
      decvalue+=base;
    }
    base*=2;
 } 
 String decc = decvalue.toString();
 return decc;
 
}
Widget BinBody() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          'Binary',
          style: TextStyle(fontSize: 20),
        ),
      ),
      Align(
        alignment: Alignment.bottomRight,
        child: Text(
          binstring,
          style: TextStyle(fontSize: 20),
        ),
      ),
      Divider(
        color: Colors.cyan,
        height: 50,
      )
    ],
  );
}

Widget Decbody() {
  return Column(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.all(15),
        child: Text(
          'Decimal',
          style: TextStyle(fontSize: 20),
        ),
      ),
      Align(alignment: Alignment.bottomRight,
      child: Text(decstring,
      style: TextStyle(fontSize: 20),),),
      Divider(
        color: Colors.cyan,
        height: 50,
      )
    ],
  );
}
