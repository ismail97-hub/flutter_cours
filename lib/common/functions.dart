
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';
import 'dart:io';

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

  Future<File?> pickImage() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result!=null) {
      return File(result.files.single.path??"");
    } else {
      return null;
    }
  }

  Future<String> saveImage(String name,File? image){
    return FileSaver.instance.saveFile(name: name,file: image);
  }