import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoppingapp/Screen/PostModel/PostModel.dart';

class homeProvider extends ChangeNotifier{

  String apiLink = "https://fakestoreapi.com/products";
  List datalist = [];
  List pro=[];

  Future<List> apiCalling() async {

    var jsonString = await http.get(Uri.parse(apiLink));

    var json = jsonDecode(jsonString.body);

    return json.map((e)=> PostModel.fromJson(e)).toList();
  }
}