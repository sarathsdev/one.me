import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  final cart;
  final sum;

  CheckoutScreen(this.cart, this.sum);

  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
        appBar: AppBar(

          title:Text('Cart',
            style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          backgroundColor: Colors.purple,
          actions: [
           FlatButton(
               onPressed: (){},
               child: Text("Total : \$${widget.sum}",
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   fontFamily: 'OpenSans',
                   fontSize: 18.0,
                   color: Colors.white
                 ),
               ),

           ),

          ],
        ),
        body: Stack(

      children: <Widget>[
            ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget.cart[index].name),
                  trailing: Text(
                    "\$${widget.cart[index].price}",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  leading: Image.network(widget.cart[index].url),
                  onTap: () {},
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: widget.cart.length,
              shrinkWrap: true,
            ),
            Divider(),

            Align(
              alignment: Alignment.bottomCenter,
              child:Container(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 40,),
                width:double.infinity,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Buy',style: TextStyle(fontSize: 18.0,fontFamily: 'OpenSans',fontWeight: FontWeight.bold),),
                  style:ElevatedButton.styleFrom(shape: StadiumBorder(),primary: Colors.purple,onPrimary: Colors.white),

                ),
              ),
            ),



      ],
    ),

    ),

    );
  }
}
