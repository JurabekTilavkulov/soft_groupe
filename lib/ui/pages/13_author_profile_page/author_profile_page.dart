import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/cubits/splash_cubit/splash_cubit.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(child: Text('ProfilePage'),),
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
}
