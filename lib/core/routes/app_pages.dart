import 'package:get/get.dart';
import 'package:getx_starter/core/pages/green_layout/login_page2.dart';
import 'package:getx_starter/core/pages/login_page.dart';
import 'package:getx_starter/core/pages/register_page.dart';
import 'package:getx_starter/core/pages/red_accent_layout/register_page2.dart';
import 'package:getx_starter/core/pages/green_layout/register_page3.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/home/bindings/home_binding.dart';
import 'package:getx_starter/home/ui/home_page.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const HomePage(),
        binding: HomeBinding()),
  ];
}
