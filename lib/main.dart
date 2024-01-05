import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:soft_groupe/ui/pages/0_splash_page/splash_page.dart';
import 'package:soft_groupe/ui/pages/2_login_page/login_page.dart';
import 'package:soft_groupe/ui/pages/3_register_page/register_page.dart';
import 'package:soft_groupe/ui/pages/4_verification_page/verification_page.dart';
import 'package:soft_groupe/ui/pages/5_select_country_page/select_country_page.dart';
import 'package:soft_groupe/ui/pages/6_topics_page/topics_page.dart';
import 'package:soft_groupe/ui/pages/7_news_source_page/news_source_page.dart';
import 'package:soft_groupe/ui/pages/8_fill_profil_page/fill_profil_page.dart';

import 'package:soft_groupe/ui/pages/9_home_page/home_page.dart';
import 'package:soft_groupe/ui/pages/forgot_password_page/forgot_page.dart';
import 'package:soft_groupe/ui/pages/onbording/page_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[

      BlocProvider(create:(context)=>SplashCubit(),
      ),


    ],
        child: MaterialApp(
          debugShowCheckedModeBanner:false,
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/',
          //initialRoute: '/HomePage',
         // routes: { '/HomePage':(context)=>HomePage()},
          onGenerateRoute: (settings) {

            switch (settings.name) {
              case "/":
                return CupertinoPageRoute(
                  builder: (context) => SplashPage(),
                );
              case "/pageView":
                return CupertinoPageRoute(
                  builder: (context) => Onbording(),
                );
              case "/loginPage":
                return CupertinoPageRoute(
                  builder: (context) => LoginPage(),
                );
              case "/registerPage":
                return CupertinoPageRoute(
                  builder: (context) => RegisterPage(),
                );
              case "/forgotPage":
                return CupertinoPageRoute(
                  builder: (context) => ForgotPage(),
                );
              case "/vertificationPage":
                return CupertinoPageRoute(
                  builder: (context) => VertificationPage(),
                );
              case "/SelectCountryPage":
                return CupertinoPageRoute(
                  builder: (context) => SelectCountryPage(),
                );
              case "/topicsPage":
                return CupertinoPageRoute(
                  builder: (context) => TopicsPage(),
                );
              case "/newsPage":
                return CupertinoPageRoute(
                  builder: (context) => NewsPage(),
                );
              case "/filProfilPage":
                return CupertinoPageRoute(
                  builder: (context) => FillProfilPage(),
                );
                case "/HomePage":
                return CupertinoPageRoute(
                  builder: (context) => HomePage(),
                );
            }
          },
        ));
  }
}


