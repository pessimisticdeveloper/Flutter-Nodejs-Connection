import 'package:flutter/material.dart';
import 'package:flutter_nodejs/services/api.dart';

class CreateData extends StatefulWidget {
  const CreateData({super.key});

  @override
  State<CreateData> createState() => _CreateDataState();
}

class _CreateDataState extends State<CreateData> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Ekleme"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Ürün İsmi",
                ),
              ),
              TextField(
                controller: priceController,
                decoration: InputDecoration(
                  hintText: "Ürün Fiyatı",
                ),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                  hintText: "Ürün Açıklaması",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    var data = {
                      "pname": nameController.text,
                      "pprice": priceController.text,
                      "pdesc": descController.text
                    };
                    Api.addProduct(data);
                  },
                  child: Text(
                    "Ürün Oluştu",
                    style: TextStyle(color: Colors.green),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
