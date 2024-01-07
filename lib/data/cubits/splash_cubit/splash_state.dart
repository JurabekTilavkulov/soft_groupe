part of 'splash_cubit.dart';

class SplashState {
  final Status? status;
  final bool? isEyeShow;
  final bool? chekBox;
  final int count;
  final String? select;


  SplashState({
    this.status,
    this.isEyeShow = false,
    this.chekBox = false,
     this.count=0,
    this.select='',

  });

  SplashState copyWith({
    Status? status,
    bool? isEyeShow,
    bool? chekBox,
    int? count,
    String? select,
    ModelNews? modelNews
  }) {
    return SplashState(
      status: status ?? this.status,
      isEyeShow: isEyeShow ?? this.isEyeShow,
      chekBox: chekBox ?? this.chekBox,
      count: count ?? this.count,
      select: select ?? this.select,
    );
  }

}
