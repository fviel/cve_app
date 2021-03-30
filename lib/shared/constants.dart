import 'package:flutter/material.dart';

const textInputDecorationFernando =  InputDecoration(
  //hintText: 'Email',
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0, style: BorderStyle.solid),

  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
  ),
);