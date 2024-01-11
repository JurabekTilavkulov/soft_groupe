import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';

import '../../../data/blocs/techno_bloc/techno_bloc.dart';
import '../../../data/blocs/tesla_bloc/tesla_bloc.dart';

class BookMarkPage extends StatelessWidget {
  const BookMarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Scaffold(
          body:  SingleChildScrollView(
            child: SafeArea(child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 20, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text("Bookmark", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
                  TextField(  //---------------------------------------------Ikkinchi TextField qatory
                    decoration: InputDecoration(
                      // prefix:SvgPicture.asset('assets/9_home_page/searche.svg'),
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.settings),
                        border: OutlineInputBorder(),
                        hintText: 'searche',
                        isDense: true
                      //suffix: SvgPicture.asset('assets/9_home_page/balance.svg'),

                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width*2,
                    child: BlocBuilder<TechnoBloc, TechnoState>(builder: (context, state) {
                      return buildBody(state);},),
                  ),
                ],
              ),
            ),),
          ),


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
              if (index == 3) {
                Navigator.pushNamed(context, "/ProfilePage");
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
  Widget buildBody(TechnoState state){

    if(state is TechnoSuccesState){
      state.data.articles?.removeWhere((element) => element.urlToImage==null);
      return ListView.builder(
          itemCount:state.data.articles?.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: (){
                  print('index :${index}');
                  Navigator.pushNamed(context, '/DatailScreenNewsPage',arguments: state.data.articles?[index]);
                },
                child:Container(
                    height: 140,
                    child: Row(children: [
                      Container(
                        height: 120,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage("${state.data.articles?[index].urlToImage}"),
                              fit: BoxFit.fill,
                            )
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${state.data.articles?[index].title}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${state.data.articles?[index].source?.name}',style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                                  Text('${state.data.articles?[index].publishedAt}',overflow:TextOverflow.ellipsis,)
                                ],)
                            ],),
                        ),
                      )
                    ],)
                ));


          });
    }
    else if(state is TeslaInitialState){
      return Center(child: CircularProgressIndicator(),);
    }
    else if(state is TeslaFailureState){
      return Center(child: Text("Failure"),);
    }
    else return Center(child: Text('No Data'),);

  }
}
