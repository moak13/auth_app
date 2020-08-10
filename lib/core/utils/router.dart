import 'package:auto_route/auto_route_annotations.dart';

import '../../features/home/view/home_view.dart';
import '../../features/login/view/login_view.dart';
import '../../features/signup/view/signup_view.dart';
import '../../features/splash/view/splash_view.dart';
import '../../features/welcome/view/welcome_view.dart';

@AdaptiveAutoRouter(routes: <AutoRoute>[
  AdaptiveRoute(page: SplashView, initial: true),
  AdaptiveRoute(page: WelcomeView),
  AdaptiveRoute(page: LoginView),
  AdaptiveRoute(page: SignupView),
  AdaptiveRoute(page: HomeView),
])
class $Router {}
