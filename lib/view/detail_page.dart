import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:tradaruprojecttest/model/product.dart';
import 'package:tradaruprojecttest/temp_save/pass_data.dart';
import 'package:tradaruprojecttest/view/widgets/counter.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ProductModel _dummyData;
  num qty;
  String selectedSize;
  int indexColor;
  List<String> size;
  List<int> colors;

  // Function Data Load

  @override
  void initState() {
    super.initState();
    setState(() {
      qty = 0;
      selectedSize = "S";
      indexColor = 0;
      size = ["S", "M", "L", "XL", "XXL", "J"];
      colors = [0xFFb7605c, 0xFF5e78be, 0xFFc29065, 0xFF919191, 0xFFa972b1, 0xFF6a9059];
      _dummyData = PassData.dataProduct;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _dummyData == null ? Container() : Container(
      color: Color(0xFFfcf3f6),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(color: Color(0xFFf9f3f4), borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                width: double.maxFinite,
                height: 300,
                child: Stack(
                  children: [
                    Image.network(_dummyData.pict, fit: BoxFit.contain, width: double.maxFinite, height: double.maxFinite,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 35,
                              height: 35,
                              child: Icon(Icons.keyboard_arrow_left_rounded, size: 35, color: Colors.black,),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _dummyData.isFavorite = _dummyData.isFavorite == "F" ? "T" : "F";
                              });
                            },
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(color: _dummyData.isFavorite == "F" ? Colors.white : Colors.pink, borderRadius: BorderRadius.all(Radius.circular(25))),
                              child: Icon(_dummyData.isFavorite == "F" ? Icons.favorite_outline : Icons.favorite, size: 20, color: _dummyData.isFavorite == "F" ? Colors.pink : Colors.white,),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                width: double.maxFinite,
                height: 450,
                decoration: BoxDecoration(color: Color(0xFFfffbfc), borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 1, 
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Image.network(_dummyData.store, fit: BoxFit.contain, width: 20, height: 20,),
                              SizedBox(width: 5),
                              Expanded(
                                flex: 1,
                                child: Text(_dummyData.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.none
                                  ),
                                ),
                              ),
                            ]
                          )
                        ), 
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.star, size: 16, color: Colors.yellowAccent,),
                            SizedBox(width: 5),
                            Text(_dummyData.rate.toString(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none
                              ),
                            ),
                            SizedBox(width: 5),
                            Text("(" + _dummyData.favoriteNumber.toString() + ")",
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 12,
                                decoration: TextDecoration.none
                              ),
                            ),
                          ]
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(_dummyData.desc,
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                        height: 1.8,
                        decoration: TextDecoration.none
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Item Size",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.maxFinite,
                      height: 40,
                      child: ListView.builder(
                        itemCount: size.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    selectedSize = size[index];
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: selectedSize == size[index] ? Colors.yellow[900] : Colors.pink, borderRadius: BorderRadius.all(Radius.circular(15))),
                                  child: Text(size[index], textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold, decoration: TextDecoration.none),),
                                ),
                              ),
                              index == size.length-1 ? Container() : SizedBox(width: 20)
                            ],
                          );
                        }
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("Item Color",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.maxFinite,
                      height: 40,
                      child: ListView.builder(
                        itemCount: colors.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Row(
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    indexColor = index;
                                  });
                                },
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(color: Color(colors[index]), border: Border.all(width: 2, color: Colors.white), borderRadius: BorderRadius.all(Radius.circular(15))),
                                  child: indexColor == index ? Icon(Icons.done_rounded, size: 10, color: colors[index] == 0xFFFFFFFF ? Colors.black : Colors.white) : Container(),
                                ),
                              ),
                              index == colors.length-1 ? Container() : SizedBox(width: 20)
                            ],
                          );
                        }
                      ),
                    )
                  ]
                )
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              height: 120,
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Qty",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 18,
                              decoration: TextDecoration.none
                            ),
                          ),
                          SizedBox(width: 5),
                          Counter()
                        ]
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text("Total : ",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 18,
                        decoration: TextDecoration.none
                            ),
                          ),
                          SizedBox(width: 5),
                          Text("\$" + _dummyData.price.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none
                            ),
                          ),
                        ]
                      )
                    ]
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    flex: 1, 
                    child: Container(
                      width: double.maxFinite,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: RaisedButton.icon(
                          icon: const Icon(Icons.shopping_cart_outlined, size: 20, color: Colors.white,),
                          label: Text("Add to chart", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                          color: Color(0xFFf98183),
                          elevation: 0,
                          onPressed: () {
                            PassData.totalOrder += 1;
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ]
        ),
    );
  }
}