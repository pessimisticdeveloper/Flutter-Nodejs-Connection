import 'package:flutter/material.dart';
import 'package:flutter_nodejs/model/product_model.dart';
import 'package:flutter_nodejs/services/api.dart';

class EditScreen extends StatefulWidget {
  final Product data;
  const EditScreen({super.key,required this.data});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {

  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.data.name.toString();
    descController.text = widget.data.desc.toString();
    priceController.text = widget.data.price.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Düzenle"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Ürün adı"
              ),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                  hintText: "Ürün fiyatı"
              ),
            ),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                  hintText: "Ürün açıklamsı"
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: (){
              Api.updateProduct(widget.data.id, {
                'pname':nameController.text,
                'pdesc':descController.text,
                'pprice':priceController.text,
                'id':widget.data.id
              });
            }, child: Text("ürünü Güncelle"))
          ],
        ),
      ),
    );
  }
}

