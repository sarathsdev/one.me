import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:oneme/screens/allcategories.dart';
import 'package:oneme/screens/login_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:oneme/ProductModel.dart';
import 'package:oneme/screens/CheckoutScreen.dart';
import 'package:oneme/screens/ProductScreen.dart';
import 'package:oneme/screens/wishlist.dart';

import 'about.dart';
import 'myaccount.dart';
import 'myorders.dart';

class ProfilePage extends StatefulWidget {
  final User user;
  const ProfilePage({required this.user});
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isSendingVerification = false;
  bool _isSigningOut = false;

  late User _currentUser;

  @override
  void initState() {
    _currentUser = widget.user;
    super.initState();
  }

  List<ProductModel> cart = [];
  int sum = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'one.me',
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 23.0),
        ),
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_active_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(cart, sum),
                ),
              );
            },
          ),
          _isSigningOut
              ? CircularProgressIndicator()
              : IconButton(
                  icon: Icon(Icons.logout),
                  onPressed: () async {
                    setState(() {
                      _isSigningOut = true;
                    });
                    await FirebaseAuth.instance.signOut();
                    setState(() {
                      _isSigningOut = false;
                    });
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(
                'NAME:\t ${_currentUser.displayName}',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                'EMAIL:\t ${_currentUser.email}',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "You",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.purple,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.purple,
              ),
            ),
            ListTile(
              title: Text(
                "Home",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(Icons.home),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "All Categories",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(
                Icons.category,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AllCategories(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "Cart",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(Icons.shopping_cart_outlined),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CheckoutScreen(cart, sum),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "Wishlist",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(
                Icons.add_circle_outline_outlined,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WishList(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "My Orders",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(
                Icons.bookmarks_outlined,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyOrders(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "My account",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(
                Icons.person_pin,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MyAccount(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text(
                "About",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              trailing: Icon(
                Icons.info_outline,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => About(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                "Notification Preferences",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Help Centre",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Privacy Policy",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text(
                "Legal",
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  color: Colors.purple,
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          ListView(
              children: [
                CarouselSlider(
                  items: [

                    //1st Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/1.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //2nd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/2.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //3rd Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/3.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    //4th Image of Slider
                    Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage("images/4.jpeg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),



                  ],

                  //Slider Container properties
                  options: CarouselOptions(
                    height: 180.0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    viewportFraction: 0.8,
                  ),
                ),
              ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,140),
            child: Center(child:Text(
                "\t\t\tFeatured Products",
              style: TextStyle(
                fontFamily: 'OpenSans',
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 15.0
              ),
            ),
            ),
          ),
          ProductScreen((selectedProduct) {
            setState(() {
              cart.add(selectedProduct); //update
              sum = 0;
              cart.forEach((item) {
                sum = sum + item.price;
              });
            });
          }),
          Padding(
            padding: const EdgeInsets.fromLTRB(0,130,0,305),
            child: Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage('images/covid_poster.jpg'),),
              ),

            ),
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0,200, 0,535),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/022-tshirt.png'),),
                  ),

                ),
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/021-trousers.png'),),
                  ),
                ),
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/019-suit.png'),),
                  ),
                ),
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/015-hawaiian_shirt.png'),),
                  ),

                ),
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/008-hoodie.png'),),
                  ),

                ),
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/012-jeans.png'),),
                  ),

                ),
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/024-underwear.png'),),
                  ),

                ),
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/004-cap.png'),),
                  ),

                ),
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/017-sneaker.png'),),
                  ),

                ),
                Container(
                  width:60.0,
                  height:3.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(image: new AssetImage('images/018-socks.png'),),
                  ),

                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

