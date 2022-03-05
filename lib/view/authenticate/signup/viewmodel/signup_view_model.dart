import 'package:assignment/view/authenticate/signup/model/signup_model.dart';
import 'package:mobx/mobx.dart';

import '../../login/service/login_network_service.dart';
part 'signup_view_model.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store {
  @observable
  SignUpModel model = SignUpModel();

  final LoginNetworkService networkService = LoginNetworkService();

  @action
  void setModelField() {
    model.email = email;
    model.password = password;
    model.passwordRetry = passwordRetry;
  }

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  String passwordRetry = "";

  @observable
  bool isPasswordVisible = false;
  @observable
  bool isPasswordRetryVisible = false;

  @observable
  bool isSignUpCompleted = false;

  @computed
  bool get isEmailOrPasswordEmpty => email.isNotEmpty == true || password.isNotEmpty == true;

  @computed
  bool get isEmailValid =>
      RegExp(r"""(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""")
          .hasMatch(email) &&
      email.isNotEmpty;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @computed
  bool get isPasswordRetryValid => passwordRetry.length >= 6;

  @computed
  bool get isPasswordsEqual => password == passwordRetry;

  @action
  void togglePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @action
  void togglePasswordRetryVisibility() => isPasswordRetryVisible = !isPasswordRetryVisible;

  @action
  void clearFieldValues() {
    email = "";
    password = "";
    passwordRetry = "";
    model.email = "";
    model.password = "";
    model.passwordRetry = "";
  }

  @action
  Future<void> signUp(context) async {
    var responseModel = await networkService.signUpPOST(context, email: email, password: password);
    if (responseModel.hasError != null) {
      if (!responseModel.hasError!) {
        isSignUpCompleted = true;
      }
    }
  }
}
