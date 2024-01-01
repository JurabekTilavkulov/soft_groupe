

import 'package:flutter_bloc/flutter_bloc.dart';


part 'splash_state.dart';
enum Status{initial,loding, loaded,error}

class SplashCubit extends Cubit<SplashState>{

  SplashCubit():super(SplashState(isEyeShow:false,status:Status.initial,chekBox:false));


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

  void isShowCount(int count) async {
    print(count);
    emit(state.copyWith(count:state.count));
  }



}