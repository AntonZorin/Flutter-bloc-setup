import 'package:flutter_setup_app/pages/home/home_page.dart';
import 'package:flutter_setup_app/pages/second/second_page.dart';
import 'package:sailor/sailor.dart';

class AppRouter {
  static final instance = Sailor();

  static void createRoutes() {
    instance.addRoute(
      SailorRoute(
        name: Screens.SECOND_PAGE,
        builder: (context, args, params) {
          return SecondPage();
        },
      ),
    );
    instance.addRoute(
      SailorRoute(
        name: Screens.HOME_PAGE,
        builder: (context, args, params) {
          return HomePage();
        },
      ),
    );
  }
}

class Screens {
  static const HOME_PAGE = "home_page";
  static const SECOND_PAGE = "second_page";
}
