part of 'splash_cubit.dart';

class SplashState {
  final Status? status;
  final bool? isEyeShow;

  SplashState({
    this.status,
    this.isEyeShow = false,
  });

  SplashState copyWith({
    Status? status,
    bool? isEyeShow,
  }) {
    return SplashState(
      status: status ?? this.status,
      isEyeShow: isEyeShow ?? this.isEyeShow,
    );
  }

}
