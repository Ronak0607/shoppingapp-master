import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../homeProvider/homeProvider.dart';

class viewScreen extends StatefulWidget {
  const viewScreen({Key? key}) : super(key: key);

  @override
  State<viewScreen> createState() => _viewScreenState();
}

class _viewScreenState extends State<viewScreen> {
  homeProvider? homeProviderTrue;
  homeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderFalse = Provider.of(context, listen: false);
    homeProviderTrue = Provider.of(context, listen: true);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Product"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color(0xFFBBBBBB),
      body: Column(
        children: [
          FutureBuilder(
            future: homeProviderFalse?.apiCalling(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              } else if (snapshot.hasData) {
                List list = snapshot.data!;
                return Expanded(
                  child: GridView.builder(
                      itemCount: list.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, childAspectRatio: (20 / 28)),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){

                            Navigator.pushNamed(context,'sub');
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        height: 200,
                                        width: 200,
                                        color: Colors.white,
                                        child:
                                            Image.network("${list[index].image}"),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${list[index].price}  \u{20B9}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25),
                                        )),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 55,
                                      child: Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(
                                            "${list[index].title}}",
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Color(0xFF6B6B6B)),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                );
              }
              return CircularProgressIndicator();
            },
          )
        ],
      ),
    ));
  }
}
