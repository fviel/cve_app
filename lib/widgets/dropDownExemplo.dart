import 'package:flutter/material.dart';

//Origem: https://www.woolha.com/tutorials/flutter-dropdownbutton-input-widget-examples

class DropdownExample extends StatefulWidget {
  @override
  _DropdownExampleState createState() {
    return _DropdownExampleState();
  }
}

class _DropdownExampleState extends State<DropdownExample> {
  String _value;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        items: [
          DropdownMenuItem<String>(
            child: Row(
              children: <Widget>[
                Icon(Icons.filter_1),
                Text('Item 1'),
              ],
            ),
            value: 'one',
          ),
          DropdownMenuItem<String>(
            child: Row(
              children: <Widget>[
                Icon(Icons.filter_2),
                Text('Item 2'),
              ],
            ),
            value: 'two',
          ),
          DropdownMenuItem<String>(
            child: Row(
              children: <Widget>[
                Icon(Icons.filter_3),
                Text('Item 3'),
              ],
            ),
            value: 'three',
          ),
        ],
        isExpanded: false,
        onChanged: (String value) {
          setState(() {
            _value = value;
          });
        },
        hint: Text('Select Item'),
        value: _value,
        underline: Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey))
          ),
        ),
        style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        ),
        iconEnabledColor: Colors.pink,
        //        iconDisabledColor: Colors.grey,
        iconSize: 40,
      ),
    );
  }
}