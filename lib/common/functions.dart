
import 'package:flutter/material.dart';

InputDecoration getInputDecoration(String label){
    return InputDecoration(
      labelText: label, //username or password
      hintText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(color: Colors.blue)
      )
    );
  }