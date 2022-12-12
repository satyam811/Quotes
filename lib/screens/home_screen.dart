import 'package:flutter/material.dart';
import 'package:quote/screens/second_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String quote = "";
  String author = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("quotes "),
        ),
        body: Column(
          children: [
             Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(quote,style: TextStyle(
                fontSize: 20
              ),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text("- $author",style: TextStyle(
                  fontSize: 15
                ),)),
            ),
            SizedBox(
              height: 80,
            ),
            ElevatedButton(
              onPressed: () async{

                var url = Uri.parse('http://api.quotable.io/random');
                var response = await http.get(url);
                print('Response status: ${response.statusCode}');
                print('Response body: ${response.body}');
                var data = jsonDecode(response.body);

                quote = data["content"];
                author = data["author"];

                setState(() {
      
                });

                // Navigator.of(context).push(MaterialPageRoute(builder: (context) => 
                // SecondScreen(quoteText: quote,authorName: author,)));
              }, 
              child: Text("Get quote!")
              ),
          ],
        ),
      ),
    );
  }
}