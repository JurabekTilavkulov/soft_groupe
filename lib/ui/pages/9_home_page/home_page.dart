import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/blocs/news_bloc/news_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:soft_groupe/data/service/NetServiceUsingRetrofit.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/model/model_news.dart';

/*class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  NewsBloc newsBloc = NewsBloc(NetWorkService(Dio()));


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      //AppleEvent('2024-01-02', '2024-01-02', 'popularity','57d556b41e0a40169cbecea58e562d76')
      create: (context) => newsBloc..add(CountryEvent('us','business','57d556b41e0a40169cbecea58e562d76')),

      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {

         if(state is NewsLoadedState){
           // quyida rasmi yoq newsni trendda chiqarmaslik chorasi qilingan
           state.data.articles?.removeWhere((element) => element.urlToImage==null);


           return Scaffold(
             body: Padding(
               padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
               child: SafeArea(
                 child: Column(
                   children: [
                     Row( //------------------------------------------------------eng tepa birinchi qator
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         SvgPicture.asset('assets/9_home_page/bosh.svg'),
                         SvgPicture.asset('assets/9_home_page/qongiroq.svg'),

                       ],
                     ),//-------------------------------------------------------eng tepa birinchi qator
                     SizedBox(height: 5),

                     TextField(  //---------------------------------------------Ikkinchi TextField qatory
                       decoration: InputDecoration(
                        // prefix:SvgPicture.asset('assets/9_home_page/searche.svg'),
                         prefixIcon: Icon(Icons.search),
                         suffixIcon: Icon(Icons.settings),
                         border: OutlineInputBorder(),
                         hintText: 'searche',
                         //suffix: SvgPicture.asset('assets/9_home_page/balance.svg'),

                       ),
                     ),//--------------------------------------------------------Ikkinchi TextField qatory
                     SizedBox(height: 5),
                     Row(//-----------------------------------------------------Uchinchi static yozuv va bitta Text button
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text('Trending',style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold,letterSpacing: 1),),
                         /// ---------------------------------------------------------------------------problem bosganda boshqa page ga otish kk
                         TextButton(onPressed: ()async{
                           await launchUrl(Uri.parse('${state.data.articles?[0].url}'));
                         }, child:Text('See all',style: TextStyle(fontSize: 18,color: Colors.black45)))


                       ],),//-----------------------------------------------------Uchinchi static yozuv

                     Column( //--------------------------------------------------tortinchi --bu rasm va yozuvlar
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           width: MediaQuery.of(context).size.width,
                           height: MediaQuery.of(context).size.width/3*2,
                           margin: EdgeInsets.all(10),

                           decoration: BoxDecoration(
                             color: Colors.cyanAccent,
                             borderRadius: BorderRadius.circular(12)
                           ),
                             child: Image.network("${state.data.articles?[0].urlToImage}",fit: BoxFit.fill,)),
                         Text('USA',style: TextStyle(color: Colors.black45,fontSize: 18)),
                         Text('${state.data.articles?[0].title}',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                         Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Text('${state.data.articles?[0].source?.name}',style: TextStyle(color: Colors.black45,fontSize: 18,fontWeight: FontWeight.bold)),
                             Text('  ${state.data.articles?[0].publishedAt}'),

                           ],
                         ),
                       ],
                     )//---------------------------------------------------------tortinchi --bu rasm va yozuvlar
                   ],
                 ),
           ),
             ),
           );
         }
         //
         else{
           return Scaffold(
             body: SafeArea(child: Center(child: CircularProgressIndicator()),),
           );
         }

        },
      ),
    );
  }
}*/


class HomePage extends StatelessWidget {
   HomePage({super.key,});

   List<String> list=['all','apple'];

  String q='';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit,SplashState>(
        bloc: context.read<SplashCubit>()..news(q),
        builder:(context,state){
          return Scaffold(
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
          ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder:(context,index){
            return TextButton(
              onPressed: (){
                q=list[index];
              },
              child: Text('${list[index]}'),
            );
          }),

          ListView.builder(
            itemBuilder: (context,index){
              return Image.network('${state.modelNews?.articles?[index].url}');
              },
          )
        ],
      );
    }
  }



}

