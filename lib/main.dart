import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'floatingwithAPI.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'API GET Method',
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('API With BottomNavigation \n Floating Action Button'),
          titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          elevation: 20,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
          leading:  IconButton(onPressed:(){} ,icon: Icon(Icons.menu_rounded,size: 32),),backgroundColor: Color.fromRGBO(10, 10, 10, .5),
        ),
        backgroundColor: Colors.white,
        body: Builder(
          builder: (context) {
            return ListView(
              children: [
                const Padding(padding: EdgeInsets.only(top: 20.0)),
                Container(
                  padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: TextFormField(
                      decoration: InputDecoration(
                          prefixIconColor: Colors.grey,
                          prefixIcon: Icon(Icons.search,size: 30,),
                          focusColor: Colors.grey,
                          fillColor: Colors.grey,
                          enabled: true,
                          contentPadding: EdgeInsets.only(left: 10,right: 10,top: 10),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          hintText: 'Search',
                          hintStyle: TextStyle(fontSize: 20)
                      )
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30,left: 20),
                  child: Align(alignment: Alignment.topLeft,widthFactor: 2.0,
                  child:Text("Carosel Slider",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic
                      ),
                  ),)
                ),
                CarouselSlider(
                    items: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 50,horizontal: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://images.pexels.com/photos/730547/pexels-photo-730547.jpeg"
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),child: Column(
                        children: [
                          SizedBox(height: 120,),
                          Text('    Ipsum is simply dummy text of the printing  simply dummy text of the printing',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.amberAccent)
                          ),                        ],
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 50,horizontal: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://images.pexels.com/photos/50987/money-card-business-credit-card-50987.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),child: Column(
                        children: [
                          SizedBox(height: 120,),
                          Text('    Ipsum is simply dummy text of the printing  simply dummy text of the printing',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.amberAccent)
                          ),                        ],
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 50,horizontal: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://images.pexels.com/photos/164501/pexels-photo-164501.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),child: Column(
                        children: [
                          SizedBox(height: 120,),
                          Text('    Ipsum is simply dummy text of the printing  simply dummy text of the printing',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.amberAccent)
                          ),                        ],
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 50,horizontal: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://images.pexels.com/photos/366551/pexels-photo-366551.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),child: Column(
                        children: [
                          SizedBox(height: 120,),
                          Text('    Ipsum is simply dummy text of the printing  simply dummy text of the printing',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.amberAccent)
                          ),                        ],
                      ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 50,horizontal: 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://images.pexels.com/photos/164636/pexels-photo-164636.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 120,),
                            Text('    Ipsum is simply dummy text of the printing  simply dummy text of the printing',textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.amberAccent,),
                            ),
                          ],
                        ),
                      ),
                    ],
                options: CarouselOptions(
                  height: 300.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  viewportFraction: 0.8,
                ),
                ),
                 Container(
                   padding: EdgeInsets.only(left: 20,right: 20),
                   child: Expanded(
                      child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        style: GoogleFonts.acme(fontSize: 30),textAlign: TextAlign.center,)
                    ),
                 ),
              ],
            );
          }
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()  {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Floating();
            }));
          },
          tooltip: 'API call',
          backgroundColor: Colors.black54,
          autofocus: true,focusColor: Colors.white,
          child: Icon(
            Icons.rocket,
            color: Colors.white,
            size: 40,
          ),
      ),
        bottomNavigationBar: Container(
          // padding: EdgeInsets.all(12),
          // margin: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: BottomNavigationBar(
            backgroundColor: Colors.black54,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home,),
                    label: 'Home',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.account_balance,),
                    label: 'Accounts'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.security,),
                    label: 'Secure'
                ),
              ],
            selectedLabelStyle: TextStyle(letterSpacing: 1.0),
            selectedFontSize: 15,
            selectedItemColor: Colors.greenAccent,
            selectedIconTheme: IconThemeData(color: Colors.greenAccent),
            elevation: 10.0,
            iconSize: 30,
            unselectedFontSize: 15,
            unselectedIconTheme: IconThemeData(color: Colors.white),
            unselectedItemColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

