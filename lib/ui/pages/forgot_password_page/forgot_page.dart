

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';

class ForgotPage extends StatelessWidget {
   ForgotPage({super.key});

  PageController pageController=PageController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
        bloc: context.read<SplashCubit>()..onbording(),
        builder:(context,state){
          return Scaffold(
            appBar: AppBar(

            ),
              body:Center(
                child:getBody(state,context),
              )
          );
        });
  }

  getBody(SplashState state, BuildContext context) {
    if(state.status==Status.loding){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state.status==Status.loaded){
      return Container(
        child:PageView(
          controller:pageController,
          physics:NeverScrollableScrollPhysics(),
          children: [
            Container(
              padding:EdgeInsets.only(left:24,right:24),
              child:Column(
                children: [
                  Container(
                    height:200,
                    width:379,
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Forgot\nPassword ?',style: TextStyle(color: Color(0xFF4E4B66),
                          fontSize: 32,
                          fontWeight: FontWeight.w700,),),
                        Text('Don’t worry! it happens. Please select the\nemail or number associated with your\naccount.',style: TextStyle(color: Color(0xFF4E4B66),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,),),
                      ],
                    ),
                  ),

                  SizedBox(
                    height:16,
                  ),

                  Container(
                    width: 383,
                    height:80,
                    decoration:BoxDecoration(
                        color:  Color(0xFFEEF1F4),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child:Row(
                      children: [
                        Padding(padding:EdgeInsets.only(left:16),
                        child:Image.asset('assets/1pageviewpage/img_3.png',width: 64,
                          height: 64,),),
                        SizedBox(width:16),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text('via Email:',style: TextStyle(color: Color(0xFF667080),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,),),
                            Text('example@youremail.com',style:TextStyle(color: Color(0xFF050505),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,),)
                          ],
                        ),

                     SizedBox(
                       width:20,
                     ),
                     Image.asset('assets/1pageviewpage/img_5.png',width: 20,
                       height: 20,)



                        
                      ],
                    ),
                  ),
                  SizedBox(
                    height:16,
                  ),
                  Container(
                    width: 383,
                    height:80,
                    decoration:BoxDecoration(
                        color:  Color(0xFFEEF1F4),
                        borderRadius: BorderRadius.circular(6)
                    ),
                    child:Row(
                      children: [
                        Padding(padding:EdgeInsets.only(left:16),
                          child:Image.asset('assets/1pageviewpage/img_4.png',width: 64,
                            height: 64,),),
                        SizedBox(width:16),
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('via Email:',style: TextStyle(color: Color(0xFF667080),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,),),
                            Text('+62-8421-4512-2531',style:TextStyle(color: Color(0xFF050505),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,),)
                          ],
                        ),

                        SizedBox(
                          width:53,
                        ),
                        Image.asset('assets/1pageviewpage/img_5.png',width: 20,
                          height: 20,)




                      ],
                    ),
                  ),
                  SizedBox(
                    height:260,
                  ),
                  MaterialButton(
                    padding:EdgeInsets.zero,
                    shape:RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(6)
                    ),
                    onPressed:(){
                    pageController.jumpToPage(1);
                    },
                  child: Container(
                    width: 380,
                    height: 50,
                    decoration:BoxDecoration(
                        color: Colors.blue,
                        borderRadius:BorderRadius.circular(6)
                    ),
                    child:Center(child:Text('Submit',style:TextStyle(color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,),),),
                  ),)
                ],
              ),
            ),
            Container(
              padding:EdgeInsets.only(left:24,right:24),
              child:ListView(
                children: [
                  Column(
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      Container(
                        height:200,
                        width:379,
                        // color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Forgot\nPassword ?',style: TextStyle(color: Color(0xFF4E4B66),
                              fontSize: 32,
                              fontWeight: FontWeight.w700,),),
                            Text('Don’t worry! it happens. Please enter the\naddress associated with your account.',style: TextStyle(color: Color(0xFF4E4B66),
                              fontSize: 16,
                              fontWeight: FontWeight.w400,),),
                          ],
                        ),
                      ),

                      Text('Email ID / Mobile number',style: TextStyle(color: Color(0xFF4E4B66),),),

                      Container(
                        width: 380,
                        height: 48,
                        child:TextField(
                          decoration:InputDecoration(
                              border:OutlineInputBorder(
                                  borderRadius:BorderRadius.circular(6)
                              )
                          ),
                        ),
                      ),

                      SizedBox(
                        height:382,
                      ),
                      MaterialButton(
                        padding:EdgeInsets.zero,
                        shape:RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(6)
                        ),
                        onPressed:(){
                          Navigator.pushReplacementNamed(context, '/vertificationPage');
                        },
                        child: Container(
                          width: 380,
                          height: 50,
                          decoration:BoxDecoration(
                              color: Colors.blue,
                              borderRadius:BorderRadius.circular(6)
                          ),
                          child:Center(child:Text('Submit',style:TextStyle(color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,),),),
                        ),)
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
