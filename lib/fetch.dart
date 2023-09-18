import 'package:flutter/material.dart';
import 'package:flutter_nodejs/model/product_model.dart';
import 'package:flutter_nodejs/services/api.dart';

class FetchData extends StatelessWidget {
  const FetchData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ürün Listesi"),
      ),
      body: FutureBuilder(
          future: Api.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              List<Product> pdata = snapshot.data;
              return ListView.builder(
                  itemCount: pdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Icon(Icons.storage),
                      title: Text("${pdata[index].name}"),
                      subtitle: Text("${pdata[index].desc}"),
                      trailing: Text("\$ ${pdata[index].price}"),
                    );
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
