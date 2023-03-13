import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Usermodel/user.dart';
import 'floatingwithAPI.dart';


class PostApiMethod extends StatefulWidget {
  const PostApiMethod({Key? key}) : super(key: key);

  @override
  State<PostApiMethod> createState() => _PostApiMethodState();
}

class _PostApiMethodState extends State<PostApiMethod> {
  List<User> user = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Post List'),titleTextStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
        elevation: 20,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
        leading:  IconButton(
          onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Floating();
          },));
        },
          icon: Icon(Icons.arrow_back_ios_new_outlined,size: 32)),backgroundColor: Color.fromRGBO(10, 10, 10, .5),
      ),
      body:  Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemBuilder: (context, int index) {
            return Column(
              children: [
              ListTile(
                title: Text(user[index].username?? 'dsadw'),
              ),
                Divider(),
            ],);
          },
            itemCount: user.length,
          )
          )
        ],
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                onPressed: () async {
                  try{
                    if(await postData()){
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Post Success')));
                    }

                  }
                  catch (e){
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.toString())));
                  }
                },
                tooltip: 'API Post call',
                backgroundColor: Colors.white,
                autofocus: true,focusColor: Colors.green,elevation: 20,
                child: const Icon(
                  Icons.rocket,
                  color: Colors.black54,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> postData() async{
    Map<String,dynamic> data = {  "userId": 1,
      "id": 101,
      "title": "qui est esse",
      "body": "est rerum tempore vitae\nsequi sint nihil reprehenderit dolor beatae ea dolores neque\nfugiat blanditiis voluptate porro vel nihil molestiae ut reiciendis\nqui aperiam non debitis possimus qui neque nisi nulla"
    };
    String url = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.post(Uri.parse(url),
        body: jsonEncode(data));
    return response.statusCode ==201;

}
  // Future<List<User>> getUser() async{
  //   String url = "https://jsonplaceholder.typicode.com/users";
  //   http.Response response = await http.get(Uri.parse(url));
  //   if(response.statusCode != 200){
  //     throw Exception('Server Error');
  //   }
  //   String responseBody = response.body;
  //   List userMap = jsonDecode(responseBody);
  //   user = userMap.map((e) {
  //     return User.fromJson(e);
  //   }).toList();
  //   return user;
  // }
}
