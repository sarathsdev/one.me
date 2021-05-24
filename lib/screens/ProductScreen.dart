import 'package:flutter/material.dart';
import 'package:oneme/screens/shop_home_profile_page.dart';
import '../ProductModel.dart';

class ProductScreen extends StatelessWidget {
  final ValueSetter<ProductModel> _valueSetter;

  ProductScreen(this._valueSetter);

  List<ProductModel> products = [
    ProductModel("US polo white shirt", 13,"https://rukminim1.flixcart.com/image/714/857/kflftzk0-0/shirt/1/n/d/m-udshc0001-u-s-polo-assn-original-imafwyf2usyrumyt.jpeg?q=50"),
    ProductModel("LP grey shirt", 14,"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRInM-ARMu81z-1OUGiQaLWoPKZl2aT0evGOivEq_qMEerxopqKbfZ53e7InxF0uSXOHfvNJZ6N&usqp=CAc"),
    ProductModel("AllenSolly pink shirt", 15,"https://allensolly.imgix.net/img/app/product/5/529579-4016699.jpg"),
    ProductModel("Logger jeans", 18,"https://images.bewakoof.com/uploads/grid/app/different-types-of-jeans-for-men-bewakoof-blog-9-1612875479.jpg"),
    ProductModel("LP grey shirt", 14,"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRInM-ARMu81z-1OUGiQaLWoPKZl2aT0evGOivEq_qMEerxopqKbfZ53e7InxF0uSXOHfvNJZ6N&usqp=CAc"),
    ProductModel("AllenSolly pink shirt", 15,"https://allensolly.imgix.net/img/app/product/5/529579-4016699.jpg"),
    ProductModel("AllenSolly pink shirt", 15,"https://allensolly.imgix.net/img/app/product/5/529579-4016699.jpg"),
    ProductModel("AllenSolly pink shirt", 15,"https://allensolly.imgix.net/img/app/product/5/529579-4016699.jpg"),
    ProductModel("AllenSolly pink shirt", 15,"https://allensolly.imgix.net/img/app/product/5/529579-4016699.jpg"),
    ProductModel("AllenSolly pink shirt", 15,"https://allensolly.imgix.net/img/app/product/5/529579-4016699.jpg"),
    ProductModel("AllenSolly pink shirt", 15,"https://allensolly.imgix.net/img/app/product/5/529579-4016699.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Padding(
      padding: EdgeInsets.fromLTRB(0,400,50,0),
      child:ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            trailing: Text(
              "\$${products[index].price}",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500),
            ),
            leading: Image.network(products[index].url),
            onTap: () {
              _valueSetter(products[index]);
            },
          );
        },

        separatorBuilder: (context, index) {
          return Divider();
        },
        itemCount: products.length),
      ),
    );
  }
}
