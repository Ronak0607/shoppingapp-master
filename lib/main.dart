import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/Screen/homeProvider/homeProvider.dart';
import 'package:shoppingapp/Screen/viewScreen/subScreen.dart';
import 'package:shoppingapp/Screen/viewScreen/viewScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => homeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => viewScreen(),
          'sub': (context) => subScreen(),
        },
      ),
    )
  );
}
