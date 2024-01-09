import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/blocs/all_bloc/all_bloc.dart';
import 'package:soft_groupe/data/blocs/apple_bloc/apple_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:soft_groupe/data/model/model_news.dart';
import 'package:soft_groupe/data/service/NetServiceUsingRetrofit.dart';
import 'package:soft_groupe/ui/pages/0_splash_page/splash_page.dart';
import 'package:soft_groupe/ui/pages/13_author_profile_page/author_profile_page.dart';
import 'package:soft_groupe/ui/pages/14_explore_page/explore_page.dart';
import 'package:soft_groupe/ui/pages/15_book_mark_page/book_mark_page.dart';
import 'package:soft_groupe/ui/pages/16_detail_screen_news_page/detail_screen_page.dart';
import 'package:soft_groupe/ui/pages/1_onbording/page_view.dart';
import 'package:soft_groupe/ui/pages/2_login_page/login_page.dart';
import 'package:soft_groupe/ui/pages/3_register_page/register_page.dart';
import 'package:soft_groupe/ui/pages/4_verification_page/verification_page.dart';
import 'package:soft_groupe/ui/pages/5_select_country_page/select_country_page.dart';
import 'package:soft_groupe/ui/pages/6_topics_page/topics_page.dart';
import 'package:soft_groupe/ui/pages/7_news_source_page/news_source_page.dart';
import 'package:soft_groupe/ui/pages/8_fill_profil_page/fill_profil_page.dart';

import 'package:soft_groupe/ui/pages/9_home_page/home_page.dart';
import 'package:soft_groupe/ui/pages/9_home_page/home_page2.dart';
import 'package:soft_groupe/ui/pages/forgot_password_page/forgot_page.dart';

import 'package:dio/dio.dart';

import 'data/blocs/news_bloc/news_bloc.dart';
import 'data/blocs/techno_bloc/techno_bloc.dart';
import 'data/blocs/tesla_bloc/tesla_bloc.dart';

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
      BlocProvider(create: (context)=>AllBloc(NetWorkService(Dio()))),
      BlocProvider(create: (context)=>AppleBloc(NetWorkService(Dio()))),
      BlocProvider(create: (context)=>NewsBloc(NetWorkService(Dio()))),
      BlocProvider(create: (context)=>TechnoBloc(NetWorkService(Dio()))),
      BlocProvider(create: (context)=>TeslaBloc(NetWorkService(Dio()))),


    ],
        child: MaterialApp(
          debugShowCheckedModeBanner:false,
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          //initialRoute: '/',
          initialRoute: '/HomePage',

          onGenerateRoute: (settings) {

            switch (settings.name) {
              // case "/":
              //   return CupertinoPageRoute(
              //     builder: (context) => SplashPage(),
              //   );
              // case "/pageView":
              //   return CupertinoPageRoute(
              //     builder: (context) => Onbording(),
              //   );
              // case "/loginPage":
              //   return CupertinoPageRoute(
              //     builder: (context) => LoginPage(),
              //   );
              // case "/registerPage":
              //   return CupertinoPageRoute(
              //     builder: (context) => RegisterPage(),
              //   );
              // case "/forgotPage":
              //   return CupertinoPageRoute(
              //     builder: (context) => ForgotPage(),
              //   );
              // case "/vertificationPage":
              //   return CupertinoPageRoute(
              //     builder: (context) => VertificationPage(),
              //   );
              // case "/SelectCountryPage":
              //   return CupertinoPageRoute(
              //     builder: (context) => SelectCountryPage(),
              //   );
              // case "/topicsPage":
              //   return CupertinoPageRoute(
              //     builder: (context) => TopicsPage(),
              //   );
              // case "/newsPage":
              //   return CupertinoPageRoute(
              //     builder: (context) => NewsPage(),
              //   );
              // case "/filProfilPage":
              //   return CupertinoPageRoute(
              //     builder: (context) => FillProfilPage(),
              //   );
                case "/HomePage":
                return CupertinoPageRoute(
                  builder: (context) => HomePage(),
                );
              case "/HomePage2":
                return CupertinoPageRoute(
                  builder: (context) => HomePage2(),
                );
              case "/DatailScreenNewsPage":
                return CupertinoPageRoute(
                  builder: (context) => DatailScreenNewsPage(articles: settings.arguments as Articles,),
                );
              case "/ExplorePage":
                return CupertinoPageRoute(
                  builder: (context) => ExplorePage(),
                );
              case "/BookMarkPage":
                return CupertinoPageRoute(
                  builder: (context) => BookMarkPage(),
                );
              case "/ProfilePage":
                return CupertinoPageRoute(
                  builder: (context) => ProfilePage(),
                );
                
            }
          },
        ));
  }
}


