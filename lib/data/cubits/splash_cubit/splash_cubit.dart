

import 'package:flutter_bloc/flutter_bloc.dart';


part 'splash_state.dart';
enum Status{initial,loding, loaded,error}

class SplashCubit extends Cubit<SplashState>{

  SplashCubit():super(SplashState(isEyeShow:false,status:Status.initial));


  void funksiya()async {
    await Future.delayed(Duration(seconds:5),(){
        emit(state.copyWith(status:Status.loaded));
      });

    }

  void onbording()async{

    print(state.status);
    emit(state.copyWith(status:Status.loding));
    print(state.status);
    await Future.delayed(Duration(seconds:3),(){
      emit(state.copyWith(status:Status.loaded));
       print(state);
     });

  }

  void isShowPassword(bool isShow) async {
    print(isShow);
    emit(state.copyWith(isEyeShow:!isShow));
  }



}