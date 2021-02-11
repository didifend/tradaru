

import 'package:flutter/material.dart';
import 'package:tradaruprojecttest/model/product.dart';
import 'package:tradaruprojecttest/temp_save/pass_data.dart';
import 'package:tradaruprojecttest/view/detail_page.dart';

class Product extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  List<ProductModel> _dummyData;

  // Function Data Load

  @override
  void initState() {
    super.initState();
    _pullDummyData();
  }

  _pullDummyData() {
    ProductModel.loadDummyData().then((value) {
      _dummyData = value;
      setState(() {});
    });
  }

  buildContent(dynamic data) {
    return Container(
      width: double.maxFinite,
      height: 200,
      child: InkWell(
        onTap: (){
          PassData.dataProduct = data;
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailPage()),
          );
        },
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: double.maxFinite,
                  height: 120,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Container(),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Expanded(
                    flex: 1, 
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Color(0xFFf9f3f4), borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.network(data.pict, fit: BoxFit.contain, width: double.maxFinite, height: double.maxFinite),
                          )
                        ),
                        Container(
                          padding: const EdgeInsets.all(15),
                          alignment: Alignment.bottomRight,
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(color: data.isFavorite == "F" ? Colors.white : Colors.pink, borderRadius: BorderRadius.all(Radius.circular(20))),
                            child: Icon(data.isFavorite == "F" ? Icons.favorite_outline : Icons.favorite, size: 15, color: data.isFavorite == "F" ? Colors.pink : Colors.white,),
                          ),
                        ),
                      ],
                    )
                  ),
                  Container(
                    width: double.maxFinite,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text(
                      data.name, 
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("\$" + data.basePrice.toString(),
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough
                        ),
                      ),
                      SizedBox(width: 5),
                      Text("\$" + data.price.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ]
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }

  buildGridContent() {
    List<dynamic> dataList = List();
    for (int i = 0; i < _dummyData.length; i+=2){
      List<dynamic> dataBaris = [_dummyData[i], _dummyData[i+1]];
      dataList.add(dataBaris);
    }
    return Container(
      width: double.maxFinite,
      alignment: Alignment.topCenter,
      child: ListView.builder(
        itemCount: dataList.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext ctxt, int index) {
        return Row(
          children: [
            Expanded(
              flex : 1,
              child: buildContent(dataList[index][0]),
            ),
            SizedBox(width: 10),
            Expanded(
              flex : 1,
              child: dataList[index].length < 2 ? Container() : buildContent(dataList[index][1]),
            )
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Popular Fashion",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text("See All",
                    style: TextStyle(
                      color: Colors.pink[300],
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Expanded(
                flex: 1,
                child: _dummyData == null ? Container() :  buildGridContent()
              )
            ]
          ),
        );
      }
    );
  }
}

