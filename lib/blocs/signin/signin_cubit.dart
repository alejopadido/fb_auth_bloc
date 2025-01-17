import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:fb_auth_bloc/repositories/auth_repository.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  final AuthRepository authRepository;
  SigninCubit(this.authRepository) : super(SigninState.initial());

  Future<void> signin({required String email, required String password}) async {
    emit(state.copyWith(signInStatus: SignInStatus.submitting));

    try {
      await authRepository.signin(email: email, password: password);

      emit(state.copyWith(signInStatus: SignInStatus.success));
    } on CustomError catch (e) {
      emit(state.copyWith(signInStatus: SignInStatus.error, error: e));
    }
  }
}
