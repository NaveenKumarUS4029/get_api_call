import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api_call/Usermodel/user.dart';
import 'package:get_api_call/models/photos.dart';
import 'package:get_api_call/postapimethod.dart';
import 'package:http/http.dart' as http;

import 'main.dart';

class Floating extends StatefulWidget {
  const Floating({Key? key}) : super(key: key);

  @override
  State<Floating> createState() => _FloatingState();
}

class _FloatingState extends State<Floating> {
  List<Photos> photo = [];
  List<User> user = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Get List'),
        titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25))),
        leading:  IconButton(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return MyHomePage();
          },));
        },
          icon: Icon(Icons.arrow_back_ios_new_outlined,size: 32),),backgroundColor: Color.fromRGBO(10, 10, 10, .5),
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(photo[index].title?? 'no title',),leading: CircleAvatar(child: Icon(Icons.person)),
                    ),Divider(),
                  ],
                );
              },
              itemCount: photo.length,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      title: Text(user[index].toString(),),leading: CircleAvatar(child: Icon(Icons.person)),
                    ),Divider(),
                  ],
                );
              },
              itemCount: user.length,
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
            onPressed: () async {
              try{
                List<Photos> data = await getPhotos();
                setState(() {
                  photo = data;
                });
              }
              catch (e){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())));
              }
            },
            tooltip: 'API Get call',
            backgroundColor: Colors.white,
            autofocus: true,focusColor: Colors.green,
            elevation: 30,
            child: Text('GET API 1',textAlign: TextAlign.center,style: TextStyle(color: Colors.black)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(onPressed: () async{
              try{
                List<User> data = await getUser();
                setState(() {
                  user = data;
                });
              }
              catch (e){
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(e.toString())));
              }
            },
                elevation: 30,
                child: Text('GET API 2',textAlign: TextAlign.center,)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PostApiMethod();
              },));
            },
              tooltip: 'POST API call',
              backgroundColor: Colors.white,
              autofocus: true,
              focusColor: Colors.green,
              elevation: 20,
              child: const Icon(
                Icons.next_plan_rounded,
                color: Colors.black54,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Photos>> getPhotos() async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode != 200){
      throw Exception("Server Error");
    }
    String responseBody = response.body;
    List photosMap = jsonDecode(responseBody);
    photo = photosMap.map((e) {
      return Photos(e['Id'], e['albumId'], e['title'], e['url'], e['thumbnailUrl']);
    }).toList();
    return photo;
  }
  Future<List<User>> getUser() async{
    String url = "https://jsonplaceholder.typicode.com/users";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode != 200){
      throw Exception('Server Error');
    }
    String responseBody = response.body;
    List userList = jsonDecode(responseBody);
    user = userList.map((e) {
      return User.fromJson(e);
    }).toList();
    return user;
  }
}
