part of 'splash_cubit.dart';

class SplashState {
  final Status? status;
  final bool? isEyeShow;
  final bool? chekBox;
  final int count;

  SplashState({
    this.status,
    this.isEyeShow = false,
    this.chekBox = false,
     this.count=0,
  });

  SplashState copyWith({
    Status? status,
    bool? isEyeShow,
    bool? chekBox,
    int? count
  }) {
    return SplashState(
      status: status ?? this.status,
      isEyeShow: isEyeShow ?? this.isEyeShow,
      chekBox: chekBox ?? this.chekBox,
      count: count ?? this.count
    );
  }

}
