

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/model/model_news.dart';
import 'package:soft_groupe/data/service/NetServiceUsingRetrofit.dart';


part 'splash_state.dart';
enum Status{initial,loding, loaded,error}

class SplashCubit extends Cubit<SplashState>{

  SplashCubit(this.netWorkService):super(SplashState(isEyeShow:false,status:Status.initial,chekBox:false,select:''));

  NetWorkService netWorkService;

  void funksiya()async {
    await Future.delayed(Duration(seconds:5),(){
        emit(state.copyWith(status:Status.loaded));
      });

    }

  void onbording()async{

    print(state);
    emit(state.copyWith(status:Status.loding));
    print(state);
    await Future.delayed(Duration(seconds:3),(){
      emit(state.copyWith(status:Status.loaded));
       print(state);
     });

  }

  void isShowPassword(bool isShow) async {
    print(isShow);
    emit(state.copyWith(isEyeShow:!isShow));
  }

  void isShowChekbox(bool chekBox1) async {
    print(chekBox1);
    emit(state.copyWith(chekBox:!chekBox1));
  }
  void isShowSelect(String select) async {
    print(select);
    emit(state.copyWith(select:select));
  }

  void isShowCount(int count) async {
    print(count);
    emit(state.copyWith(count:state.count));
  }





}