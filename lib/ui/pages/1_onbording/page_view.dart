


import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';


class Onbording extends StatelessWidget {
   Onbording({super.key});

   // onbording



  PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
      bloc: context.read<SplashCubit>()..onbording(),
        builder:(context,state){
          return Scaffold(
            body:Center(
              child:getBody(state,context),
            )
          );
        });
  }

  getBody(SplashState state, BuildContext context,  ) {
    if(state.status==Status.loding){
      return Center(child:CircularProgressIndicator(),);
    }
    if(state.status==Status.loaded){
      return Column(
        children: [
          Expanded(
            flex:7,
            child:PageView(
            controller: pageController,
            onPageChanged: (index2){
              state.count!=index2;
              context.read<SplashCubit>().isShowCount(index2);

            },
            children: [
              Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Image.asset('assets/1pageviewpage/cub.png'),
                    Padding(padding:EdgeInsets.only(top:24,left: 24),
                      child:Text('Lorem Ipsum is simply\ndummy',style:TextStyle(color: Colors.black,
                        fontSize: 24,fontWeight: FontWeight.w700,),),),

                    Padding(padding:EdgeInsets.only(left:24),
                      child:Text('Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.',
                        style:TextStyle(color: Color(0xFF4E4B66),
                            fontSize: 16,fontWeight: FontWeight.w400),),),

                  ],
                ),
              ),
              Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/1pageviewpage/img.png'),
                    Padding(padding:EdgeInsets.only(top:24,left: 24),
                      child:Text('Lorem Ipsum is simply\ndummy',style:TextStyle(color: Colors.black,
                        fontSize: 24,fontWeight: FontWeight.w700,),),),

                    Padding(padding:EdgeInsets.only(left:24),
                      child:Text('Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.',
                        style:TextStyle(color: Color(0xFF4E4B66),
                            fontSize: 16,fontWeight: FontWeight.w400),),),

                  ],
                ),
              ),
              Container(
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/1pageviewpage/bonka.png'),
                    Padding(padding:EdgeInsets.only(top:24,left: 24),
                      child:Text('Lorem Ipsum is simply\ndummy',style:TextStyle(color: Colors.black,
                        fontSize: 24,fontWeight: FontWeight.w700,),),),

                    Padding(padding:EdgeInsets.only(left:24),
                      child:Text('Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.',
                        style:TextStyle(color: Color(0xFF4E4B66),
                            fontSize: 16,fontWeight: FontWeight.w400),),),

                  ],
                ),
              )
            ],
          ),),
         



       Expanded(child: Positioned(
           top:745,
           left:24,
           child:Row(
             mainAxisAlignment:MainAxisAlignment.spaceEvenly,
             children: [

               Expanded(child:Padding(
                 padding:EdgeInsets.only(right:80),
                 child: DotsIndicator(
                     decorator: DotsDecorator(
                       activeColor: Colors.blue,
                     ),
                     dotsCount:3,
                     position:state.count
                 ),
               ),),

               Expanded(child:Padding(
                 padding:EdgeInsets.only(left:80),
                 child: MaterialButton(
                   padding: EdgeInsets.zero,
                   shape:RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(6)
                   ),
                   onPressed:(){
                     Navigator.pushReplacementNamed(context,'/loginPage' );
                   },
                   child:  Container(
                     width: 85,
                     height: 50,
                     decoration:BoxDecoration(
                         borderRadius: BorderRadius.circular(6),
                         color: Colors.blue
                     ),
                     child:Center(child:Text('Next',style:TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color:Colors.white),),),
                   ),),
               ))


             ],
           )))
        ],
      );
    }
  }
}



/*
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

  Widget? getBody(SplashState state, BuildContext context) {
    if(state is SplashProgres){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state is SplashEnd){
      return PageView(

      );
    }
  }

}*/