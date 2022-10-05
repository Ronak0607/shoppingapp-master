import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/Screen/homeProvider/homeProvider.dart';

class subScreen extends StatefulWidget {
  const subScreen({Key? key}) : super(key: key);

  @override
  State<subScreen> createState() => _subScreenState();
}

class _subScreenState extends State<subScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
        title: Text("Product"),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Container(
            height: 500,
            width: double.infinity,
            color: Colors.blue,
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("123.20",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w900),),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text("Title",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                children: [

                  Text("Description",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                  Text("Description",style: TextStyle(fontSize: 20)),

                ],
              )
            ],
          )

        ],
      )),
    );
  }
}
