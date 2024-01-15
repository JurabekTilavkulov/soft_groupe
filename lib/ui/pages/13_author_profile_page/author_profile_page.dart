import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/hive/hive.dart';

import '../../../data/cubits/splash_cubit/splash_cubit.dart';

class ProfilePage extends StatelessWidget {
   ProfilePage({Key? key}) : super(key: key);

  HiveRepository hiveRepository=HiveRepository();
  @override
  Widget build(BuildContext context) {
    String name=hiveRepository.getName();
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(child:getBody(state,context,name),),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (int index) {
              BlocProvider.of<SplashCubit>(context).onChangeOnly(
                  value1: index); // o'zgaruvchiga qiymat berilmoqda

              if (index == 0) {
                Navigator.pushNamed(context,"/HomePage");
              }
              if (index == 1) {
                Navigator.pushNamed(context, "/ExplorePage");
              }
              if (index == 2) {
                Navigator.pushNamed(context, "/BookMarkPage");
              }
            },
            unselectedItemColor: Colors.black,
            showUnselectedLabels: true,
            selectedItemColor: Colors.blue,
            currentIndex: state.value1!,
            // o'zgaruvchidan qiymat olinmoqda

            items: const[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.explore), label: "Explore"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.bookmark), label: "Bookmark"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.portrait_rounded), label: "Profile"),
            ],
          ),
        );
      },
    );
  }

  getBody(SplashState state, BuildContext context,name) {
    if(state.status==Status.loding){
      return Center(child: CircularProgressIndicator(),);
    }
    if(state.status==Status.loaded){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height:30,
          ),
          Row(
            children: [
              Expanded(child:Image.asset('assets/1pageviewpage/img_19.png',width: 100,
                height: 100,),),
              Expanded(child:Column(children: [
                Text('1.2M',style:TextStyle(fontSize: 16,
                fontWeight: FontWeight.w600,),),
                Text(
                'Followers',
                style: TextStyle(
                  color: Color(0xFF4E4B66),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )],)),
              Expanded(child:Column(children: [
                Text('124K',style:TextStyle(fontSize: 16,
                  fontWeight: FontWeight.w600,),),
                Text(
                  'Following',
                  style: TextStyle(
                    color: Color(0xFF4E4B66),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                )],)),
            ],
          ),
          SizedBox(
            height:20,
          ),
          Container(
            margin:EdgeInsets.only(left:15),
            width: 380,
            height: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,style:TextStyle(fontSize:25,
                    fontWeight: FontWeight.w600),)
              ],
            ),
          )

        ],
      );
    }
  }
}
