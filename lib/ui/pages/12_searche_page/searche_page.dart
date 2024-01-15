import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/blocs/all_bloc/all_bloc.dart';
import 'package:soft_groupe/data/blocs/news_bloc/news_bloc.dart';
import 'package:svg_flutter/svg.dart';

import '../../../data/model/searcheModel.dart';

class SearchePage extends StatelessWidget {
   SearchePage({Key? key}) : super(key: key);
  List<SearcheModel> list=[];

  @override
  Widget build(BuildContext context) {
    list.add(SearcheModel(rasm: 'assets/1pageviewpage/img_10.png', name: 'BBC News', followers: '225K Followers'));
    list.add(SearcheModel(rasm: 'assets/1pageviewpage/img_12.png', name: 'CNN', followers: '254K Followers'));
    list.add(SearcheModel(rasm: 'assets/1pageviewpage/img_9.png', name: 'Vox', followers: '215K Followers'));
    list.add(SearcheModel(rasm: 'assets/1pageviewpage/img_15.png', name: 'USA Today', followers: '25K Followers'));
    list.add(SearcheModel(rasm: 'assets/1pageviewpage/img_7.png', name: 'CNBC', followers: '295K Followers'));
    list.add(SearcheModel(rasm: 'assets/1pageviewpage/img_14.png', name: 'CNET', followers: '275K Followers'));
    list.add(SearcheModel(rasm: 'assets/1pageviewpage/img_13.png', name: 'MSN', followers: '255K Followers'));

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(

                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value){

                          },
                          decoration:InputDecoration(
                            border:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(onPressed: () {

                                },
                                    icon: SvgPicture.asset('assets/9_home_page/searche.svg'))

                            ),
                            suffixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(onPressed: () {
                                  Navigator.pop(context);
                                },
                                    icon: SvgPicture.asset('assets/16_detail_screen_news_page/reject.svg'))

                            ),
                            hintText: "Searche",

                          ),

                        )
                      ],
                    )),
              ),
                SizedBox(height: 10,),

                TabBar(
                  tabAlignment: TabAlignment.center,
                    tabs: [
                  Tab(text: "News",),
                  Tab(text: "Topics",),
                  Tab(text: "Author",),
                ]),
                SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height*0.72,

                    child: TabBarView(children: [
                      BlocBuilder<AllBloc, AllState>(
  
                        builder: (contextA, stateA) {
                          
                          return Container(
                            child: buildBodyA(stateA),
                          );
                          },
                      ),
                      Container(),
                      Container(  height: MediaQuery.of(context).size.width*0.4,

                        child: ListView.builder(
                          itemCount: 7,
                          itemBuilder: (context, index) {
                            return buildBodyN(context, index);
                          },),)
                    ]),
                  ),
                )
            ],),
          ),
        ),
      ),
    );
  }
  Widget buildBodyN(BuildContext context, int index){
    return Container(
      height: MediaQuery.of(context).size.width*0.5,
      child: Row(children: [
        Image.asset(list[index].rasm,width: 100,),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         Text('${ list[index].name}',style: TextStyle(fontSize: 18),),
         Text('${ list[index].followers}'),
        ],),
      MaterialButton(onPressed: () {

           },
         child: Container(
          width: MediaQuery.of(context).size.width / 4,
          height: MediaQuery.of(context).size.width / 12,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.blue
          ),
          child: Center(child: Text("Following", style: TextStyle(fontSize: 16,
              color: Colors.white),)),
        ),)
      ],),
    );
  }
  Widget buildBodyA(AllState state){

     if(state is AllSuccsesState){
       state.modelNews.articles?.removeWhere((element) => element.urlToImage==null);

       return ListView.builder(
           itemCount:state.modelNews.articles?.length??0,
           itemBuilder: (BuildContext context, int index) {
             return GestureDetector(onTap: () {
               Navigator.pushNamed(context, '/DatailScreenNewsPage',
                   arguments: state.modelNews.articles?[index]);
             },
             child: Container(
                 height: 140,
                 child: Row(children: [
                   Container(
                     height: 120,
                     width: 140,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         image: DecorationImage(
                           image: NetworkImage("${state.modelNews.articles?[index].urlToImage}"),
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
                           Text('${state.modelNews.articles?[index].title}',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                           Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Text('${state.modelNews.articles?[index].source?.name}',style: TextStyle(fontSize: 14,color: Colors.black45,fontWeight: FontWeight.bold),overflow:TextOverflow.ellipsis,),
                               Text('${state.modelNews.articles?[index].publishedAt}',overflow:TextOverflow.ellipsis,)
                             ],)
                         ],),
                     ),
                   )
                 ],)
             ) );


           });
     }
     else if(state is AllInitialState){
       return Container(
         child: SafeArea(child: Center(child: CircularProgressIndicator()),),
       );
     }
     else return Center(child: Text('error'),);
   }
}
