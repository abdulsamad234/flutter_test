// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_starter/core/components/buttons/custom_button.dart';
import 'package:getx_starter/core/components/buttons/facebook_button.dart';
import 'package:getx_starter/core/components/buttons/google_button.dart';
import 'package:getx_starter/core/components/utils/utils.dart';
import 'package:getx_starter/core/components/widgets/bottom_bar.dart';
import 'package:getx_starter/core/components/widgets/custom_app_bar.dart';
import 'package:getx_starter/core/components/widgets/post_widget.dart';
import 'package:getx_starter/core/constants/colors.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/extension/context_extension.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/core/routes/app_routes.dart';
import 'package:getx_starter/home/controller/home_controller.dart';
import 'package:getx_starter/home/model/post.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhiteColor,
      appBar: CustomAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColorLight,

        //Floating action button on Scaffold
        onPressed: () {
          //code to execute on button press
        },
        child: Icon(Icons.add), //icon inside button
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomBottomBar(),
      body: Container(
        // padding: EdgeInsets.only(left: 18, right: 18, bottom: 0, top: 0),
        child: GetX<HomeController>(
          initState: (state) async {
            // Get.find<HomeController>().getUser();
            //box = await Hive.openBox('user');
            state.controller?.pagingController.value
                .addPageRequestListener((pageKey) {
              state.controller?.fetchPage(pageKey);
            });
            // state.controller?.pagingController.value.scr
          },
          builder: (_) {
            return PagedListView<int, dynamic>(
              pagingController:
                  Get.find<HomeController>().pagingController.value,
              builderDelegate: PagedChildBuilderDelegate<dynamic>(
                itemBuilder: (context, item, index) => PostWidget(
                  currentPost: item,
                ),
              ),
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
            );
          },
        ),
      ),
    );
  }
}
