import 'package:flutter/material.dart';
import 'package:flutter_nodejs/create.dart';
import 'package:flutter_nodejs/delete.dart';
import 'package:flutter_nodejs/fetch.dart';
import 'package:flutter_nodejs/update.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER NODE.JS APP"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateData()));
                },
                child: Text(
                  "Ürün Ekleme",
                  style: TextStyle(color: Colors.green),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FetchData()));
                },
                child: Text("Ürün Listesi",
                    style: TextStyle(color: Colors.yellow))),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UpdateScreen()));
                },
                child: Text("Ürün Güncelleme",
                    style: TextStyle(color: Colors.blue))),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DeleteScreen()));
                },
                child: Text("Ürün Silme", style: TextStyle(color: Colors.red))),
          ],
        ),
      ),
    );
  }
}
