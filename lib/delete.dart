import 'package:flutter/material.dart';
import 'package:flutter_nodejs/model/product_model.dart';
import 'package:flutter_nodejs/services/api.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Ürünü Sil"),
        ),
        body: FutureBuilder(
            future: Api.getProduct(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<Product> pdata = [];
                return ListView.builder(
                    itemCount: pdata.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(Icons.storage),
                        title: Text("${pdata[index].name}"),
                        subtitle: Text("${pdata[index].desc}"),
                        trailing: IconButton(
                          onPressed: () {
                            Api.deleteProduct(pdata[index].id);
                            pdata.removeAt(index);
                            setState(() {});
                          },
                          icon: Icon(Icons.delete),
                        ),
                      );
                    });
              }
            }));
  }
}
