
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';

class FillProfilPage extends StatelessWidget {
   FillProfilPage({super.key});
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
        bloc: context.read<SplashCubit>()..onbording(),
        builder:(context,state){
          return Scaffold(
              appBar: AppBar(

                centerTitle:true,
                title:Text('Fill your Profile',style: TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w600,),),
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
      return Column(
        children: [
          Expanded(child:Center(
            child:Stack(
              children: [
               Image.asset('assets/1pageviewpage/img_19.png',width: 140,
                 height: 140,),
                Positioned(
                  top:109,
                    left:98,
                    child:Image.asset('assets/1pageviewpage/img_21.png',width: 30,
                  height: 30))
              ],
            ),
          )),
          Expanded(
            flex:4,
              child:Container(
                padding: EdgeInsets.only(left:24,right: 24),
                child:ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                            TextSpan(
                                children:[
                                  TextSpan(
                                      text: 'Username',
                                      style: TextStyle(
                                        color: Color(0xFF4E4B66),
                                        fontSize: 14,
                                      )
                                  ),
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                      )
                                  )
                                ]
                            )
                        ),
                        SizedBox(
                          height:4,
                        ),
                        Form(
                            key: _formKey1,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value){
                                    if(value==null || value.isEmpty){
                                      return 'Please enter some username';
                                    }
                                    return null;

                                  },
                                  decoration:InputDecoration(
                                      border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),

                                )
                              ],
                            )),
                        SizedBox(
                          height:16,
                        ),
                        Text.rich(
                            TextSpan(
                                children:[
                                  TextSpan(
                                      text: 'Full Name',
                                      style: TextStyle(
                                        color: Color(0xFF4E4B66),
                                        fontSize: 14,
                                      )
                                  ),
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                      )
                                  )
                                ]
                            )
                        ),
                        SizedBox(
                          height:4,
                        ),
                        Form(
                            key: _formKey2,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value){
                                    if(value==null || value.isEmpty){
                                      return 'Please enter some Full Name';
                                    }
                                    return null;

                                  },
                                  decoration:InputDecoration(
                                      border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),

                                )
                              ],
                            )),

                        SizedBox(
                          height:16,
                        ),
                        Text.rich(
                            TextSpan(
                                children:[
                                  TextSpan(
                                      text: 'Email Address',
                                      style: TextStyle(
                                        color: Color(0xFF4E4B66),
                                        fontSize: 14,
                                      )
                                  ),
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                      )
                                  )
                                ]
                            )
                        ),
                        SizedBox(
                          height:4,
                        ),
                        Form(
                            key: _formKey3,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value){
                                    if(value==null || value.isEmpty){
                                      return 'Please enter some Email Address';
                                    }
                                    return null;

                                  },
                                  decoration:InputDecoration(
                                      border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),

                                )
                              ],
                            )),

                        SizedBox(
                          height:16,
                        ),
                        Text.rich(
                            TextSpan(
                                children:[
                                  TextSpan(
                                      text: 'Phone Number',
                                      style: TextStyle(
                                        color: Color(0xFF4E4B66),
                                        fontSize: 14,
                                      )
                                  ),
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                      )
                                  )
                                ]
                            )
                        ),
                        SizedBox(
                          height:4,
                        ),
                        Form(
                            key: _formKey4,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value){
                                    if(value==null || value.isEmpty){
                                      return 'Please enter some Phone Number';
                                    }
                                    return null;

                                  },
                                  decoration:InputDecoration(
                                      border:OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),

                                )
                              ],
                            )),

                        SizedBox(
                          height:100,
                        ),

                        MaterialButton(
                          color: Colors.white,
                          onPressed: (){
                            if (_formKey1.currentState!.validate() && _formKey2.currentState!.validate()
                            && _formKey3.currentState!.validate() && _formKey4.currentState!.validate() ) {
                              Navigator.pushReplacementNamed(context,'/HomePage');
                            }
                          },
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(6)
                          ),
                          child: Container(
                            width: 380,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(6)
                            ),
                            child:Center(
                              child: Text(
                                'Next',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),
                              ),
                            ),
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              )),

        ],
      );
    }

  }
}
