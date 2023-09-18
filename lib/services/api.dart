import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_nodejs/model/product_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.0.16:2000/api/";
  static addProduct(Map pdata) async {
    var url = Uri.parse("${baseUrl}add_product");
    try {
      final res = await http.post(url, body: pdata);
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("hata var..");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static getProduct() async {
    List<Product> products = [];

    var url = Uri.parse("${baseUrl}get_product");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        data['products'].forEach((value) => {
              products.add(
                Product(
                    name: value['pname'],
                    price: value['pprice'],
                    desc: value['pdesc'],
                    id: value['id'].toString(),
                ),
              ),
            });
        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  static updateProduct(id, body) async{
    var url = Uri.parse("${baseUrl}update/$id");

    final res = await http.post(url, body: body);
    if(res.statusCode == 200){
      print(jsonDecode(res.body));
    }else{
      print("hata");
    }
  }
  
  static deleteProduct(id) async {
    var url = Uri.parse("${baseUrl}delete/$id");

    final res = await http.post(url);
    if(res.statusCode == 204){
      print(jsonDecode(res.body));
    }else{
      print("hata");
    }
  }
}
