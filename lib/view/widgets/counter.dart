import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int jumlah = 0;

  count(int val){
    jumlah+=val;
    jumlah = jumlah < 0 ? 0 : jumlah;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, 
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              count(-1);
            },
            child: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Text("-", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[850], fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.none),),
            ),
          ),
          SizedBox(width: 5),
          Text(jumlah.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              decoration: TextDecoration.none
            ),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: (){
              count(1);
            },
            child: Container(
              width: 25,
              height: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Text("+", textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[850], fontSize: 18, fontWeight: FontWeight.bold, decoration: TextDecoration.none),),
            ),
          ),
        ]
      )
    );
  }
}