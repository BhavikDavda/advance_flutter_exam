
import 'package:advance_flutter_exam/provider/apiprovider.dart';
import 'package:advance_flutter_exam/screens/diatalpage.dart';
import 'package:advance_flutter_exam/screens/home_page.dart';
import 'package:advance_flutter_exam/screens/like_page.dart';
import 'package:advance_flutter_exam/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (context) => QuotesProvider(),
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              routes: {
                "/": (context) => Splash(),
                "home": (context) => HomePage(),
                "like": (context) => LikedQuotesPage(),
                "detail": (context) => QuoteDetailPage(),

              },
            );
          },
        ),
      ]));
  //     MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       routes: {
  //         "/": (context) => Splash(),
  //         "home": (context) => HomePage(),
  //         "like": (context) => LikePage(),
  //       },
  //     ),
  //);
}
