import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:soft_groupe/ui/pages/0_splash_page/splash_page.dart';
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
      )

    ],
        child: MaterialApp(
          debugShowCheckedModeBanner:false,
          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          initialRoute: '/',
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
            }
          },
        ));
  }
}


