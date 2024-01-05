

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:soft_groupe/data/model/model_news.dart';
import 'package:soft_groupe/data/service/NetServiceUsingRetrofit.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NetWorkService netWorkService;
  NewsBloc(this.netWorkService) : super(NewsInitialState()) {

    //--------------------------------------------------------------------------
    on<AppleEvent>((event, emit) async{
      try{
        ModelNews modelNews=await netWorkService.appleNews(event.from,event.to,event.sortBy,event.apiKey);

        print(modelNews);
        if(modelNews!=null){
          emit(NewsLoadedState(modelNews));
        }
        else (NewsFailureState());
      }
      on Exception catch(_){
        print('e== ${_}');
        emit(NewsFailureState());
        rethrow;
      }
    });
    //--------------------------------------------------------------------------

    on<CountryEvent>((event, emit) async{
      try{
        ModelNews modelNews=await netWorkService.countryNews(event.country,event.category,event.apiKey);

        print(modelNews);
        if(modelNews!=null){
          emit(NewsLoadedState(modelNews));
        }
        else (NewsFailureState());

      }
      on Exception catch(_){
        print('e-- ${_}');
        emit(NewsFailureState());
        rethrow;
      }
    });
    //--------------------------------------------------------------------------
  }
}
