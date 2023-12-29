
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_state.dart';

class PageView extends StatelessWidget {
  const PageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
      bloc: context.read<SplashCubit>()..onbording(),
      builder: (BuildContext context, SplashState state){
        return Scaffold(
          body:Center(
            child:getBody(state,context),
          ),
        );
      },
    );
  }

  getBody(SplashState state, BuildContext context) {
    if(state is SplashProgres){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is SplashEnd){
      return Container(
        child: const PageView(

        ),
      );
    }
  }

}