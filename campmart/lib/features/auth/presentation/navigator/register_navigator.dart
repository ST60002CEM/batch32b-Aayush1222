import 'package:campmart/app/navigator/navigator.dart';
import 'package:campmart/features/auth/presentation/view/register_view.dart';

class RegisterViewNavigator {}

mixin RegisterViewRoute {
  openRegisterView() {
    NavigateRoute.pushRoute(RegisterView());
  }
}
