import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controllerSearch = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Fashion Shop",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 10),
          Text("Get popular fashion from home",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 15),
          Container(
            child: TextField(
              decoration: InputDecoration(
              contentPadding: EdgeInsets.all(5),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(10)),
                borderSide: BorderSide(
                    width: 1,
                    color: Colors.pink[300]),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                    Radius.circular(10)),
                borderSide: BorderSide(
                    width: 1,
                    color: Colors.white),
              ),
              border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(
                          Radius.circular(10)),
                  borderSide: BorderSide(
                    width: 1,
                  )),
              hintText: "Search the clothes you need",
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[400]),
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.search,
                  color: Colors.grey[400]),
              focusColor: Colors.green),
            cursorColor: Colors.green,
            controller: controllerSearch,
            style: TextStyle(color: Colors.white),
            textAlignVertical: TextAlignVertical.center,
          ),
        ),
        ]
      ),
    );
  }
}