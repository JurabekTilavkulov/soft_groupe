

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soft_groupe/data/cubits/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState>{

  SplashCubit():super(SplashLoadedInitialState());


    fuksiya(){

      Future.delayed(Duration(seconds:5),(){
        emit(SplashLoadedSucsesState());
      });

    }



}