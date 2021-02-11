import 'package:flutter/material.dart';
import 'package:tradaruprojecttest/model/categories.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<CategoriesModel> _dummyData;
  double widthScreen = 0, heightScreen = 0;

  // Function Data Load

  @override
  void initState() {
    super.initState();
    _pullDummyData();
  }

  void _pullDummyData() {
    CategoriesModel.loadDummyData().then((value) {
      _dummyData = value;
      setState(() {});
    });
  }

  

  Container buildTableContent() {
    return Container(
      alignment: Alignment.center,
      child: ListView.builder(
        itemCount: _dummyData.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext ctxt, int index) {
          return Row(
            children: [
              InkWell(
                child: Container(
                  width: 120,
                  height: 120,
                  padding: const EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1, 
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.network(_dummyData[index].pict),
                        )
                      ),
                      Container(
                        height: 40,
                        alignment: Alignment.center,
                        child: Text(
                          _dummyData[index].name, 
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  )
                ),
              ),
              index == _dummyData.length-1 ? Container() : SizedBox(width: 10)
            ],
          );
        }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Categories",
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
            child: _dummyData == null ? Container() : buildTableContent()
          )
        ]
      ),
    );
  }
}