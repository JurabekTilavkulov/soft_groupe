


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
              state.count=index2;
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
         



       Expanded(child:
       Positioned(
           top:745,
           left:24,
           child:Row(
             mainAxisAlignment:MainAxisAlignment.spaceEvenly,
             children: [


                  Container(child: DotsIndicator(
                      onTap: (index){
                        state.count=index;
                        pageController.jumpToPage(index);
                      },
                      decorator: DotsDecorator(
                        activeColor: Colors.blue,
                      ),
                      dotsCount:3,
                      position:state.count
                  ),),


               if(state.count==0)SizedBox(
                 width:200,
               ),
               if(state.count==1)SizedBox(
                 width:120,
               ),

               if(state.count==2)SizedBox(
                 width:70,
               ),


               if(state.count==1)TextButton(onPressed:(){pageController.jumpToPage(0);},child:
               Text('Back',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFFB0B3B8),),)),
               if(state.count==1 || state.count==0)InkWell(
                 borderRadius: BorderRadius.circular(6),
                 onTap: (){
                   pageController.nextPage(duration:Duration(milliseconds:5), curve:Curves.ease);
                 },
                 child: Container(
                   width: 85,
                   height: 50,
                   decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(6)
                   ),
                   child: Center(
                     child: Text('Next',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                   ),
                 ),
               ),



               if(state.count==2)TextButton(onPressed:(){pageController.jumpToPage(1);},child:
               Text('Back',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFFB0B3B8),),)),
               if(state.count==2)InkWell(
                 borderRadius: BorderRadius.circular(6),
                 onTap: (){
                   Navigator.pushReplacementNamed(context, '/loginPage');
                 },
                 child:Container(
                   width: 142,
                   height: 50,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(6),
                       color: Colors.blue
                   ),
                   child: Center(
                     child: Text("Get Started",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                   ),
                 ) ,),


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