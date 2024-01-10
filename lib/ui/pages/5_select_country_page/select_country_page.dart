
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';

class SelectCountryPage extends StatelessWidget {
  const SelectCountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
        bloc: context.read<SplashCubit>()..onbording(),
        builder:(context,state){
          return Scaffold(

              appBar: AppBar(

                centerTitle:true,
              title:Text('Select your Country',style: TextStyle(fontSize: 16,
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
          Container(
            width: 379,
            height: 48,
            child:TextField(

              decoration:InputDecoration(
                suffixIcon:Icon(Icons.search),
                border:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6)
                ),
                hintText: "Search"
              ),
            ),
          ),

          Expanded(child: ListView.builder(itemBuilder:(context,index){
            return Padding(padding:EdgeInsets.only(left:24,top:16),
              child:Row(
                children: [
                  Image.asset('assets/1pageviewpage/img_6.png',width: 32,
                    height: 32,),
                  SizedBox(
                    width:16,
                  ),
                  Text('Afghanistan',style:TextStyle(color: Color(0xFF4E4B66),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,),)
                ],
              ),
            );

          },
            itemCount:40,
          )
          ),
          SizedBox(
            height:20,
          ),
          MaterialButton(
            padding:EdgeInsets.zero,
            shape:RoundedRectangleBorder(
                borderRadius:BorderRadius.circular(6)
            ),
            onPressed:(){
              Navigator.pushReplacementNamed(context, '/topicsPage');
            },
            child: Container(
              width: 380,
              height: 50,
              decoration:BoxDecoration(
                  color: Colors.blue,
                  borderRadius:BorderRadius.circular(6)
              ),
              child:Center(child:Text('Next',style:TextStyle(color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,),),),
            ),),
          SizedBox(
            height:20,
          )
        ],
      ) ;
    }

  }
}
