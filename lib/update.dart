import 'package:flutter/material.dart';
import 'package:flutter_nodejs/edit.dart';
import 'package:flutter_nodejs/model/product_model.dart';
import 'package:flutter_nodejs/services/api.dart';

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Güncelleme"),
      ),
      body: FutureBuilder(
          future: Api.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditScreen(data: pdata[index]),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit),
                        ));
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
