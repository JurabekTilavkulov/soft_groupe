import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>SplashCubit(),
    child: BlocListener(
      listener: (context,state){
       if(state==SplashLoadedSucsesState){
          Navigator.pushReplacementNamed(context,'/pageView');
       }
      },
     child: Scaffold(
       body:Center(
         child: Image.asset('assets/bosh.png'),
       ),
     ),
    ),);
  }
}
