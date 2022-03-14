import 'package:get/get.dart';
import 'package:getx_starter/core/constants/hive_keys.dart';
import 'package:getx_starter/core/init/cache/hive_manager.dart';
import 'package:getx_starter/home/model/post.dart';
import 'package:getx_starter/home/repository/home_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  final RxString _userName = "".obs;
  final Rx<PagingController<int, dynamic>> pagingController =
      PagingController(firstPageKey: 0).obs;
  HomeController(this._repository) : assert(_repository != null);

  get userName => _userName.value;

  set userName(value) => _userName.value = value;

  getUser() async {
    var result = await _repository.getUser();
    _userName.value = result.name!;
  }

  changeValue() {
    userName = "Template";
  }

  saveUser() async {
    HiveManager.instance.setStringValue(HiveKeys.USERNAME, userName);
  }

  getFromHiveManager() {
    return HiveManager.instance.getStringValue(HiveKeys.USERNAME);
  }

  static const _pageSize = 3;

  Future<List<Post>> getPosts() async {
    final delay = await Future.delayed(Duration(seconds: 4));
    return [
      Post(
          name: 'Jane Doe',
          comments: 3,
          shares: 34,
          content:
              'The collapse of the online-advertising market in 2001 made marketing on the internet seem even less compelling. Website usability, press releases...',
          hoursAgo: 4,
          imageUrl:
              'https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg',
          likes: 30),
      Post(
          name: 'Jane Doe',
          comments: 3,
          shares: 34,
          content:
              'The collapse of the online-advertising market in 2001 made marketing on the internet seem even less compelling. Website usability, press releases...',
          hoursAgo: 4,
          imageUrl:
              'https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg',
          likes: 30),
      Post(
          name: 'Jane Doe',
          comments: 3,
          shares: 34,
          content:
              'The collapse of the online-advertising market in 2001 made marketing on the internet seem even less compelling. Website usability, press releases...',
          hoursAgo: 4,
          imageUrl:
              'https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg',
          likes: 30),
      Post(
          name: 'Jane Doe',
          comments: 3,
          shares: 34,
          content:
              'The collapse of the online-advertising market in 2001 made marketing on the internet seem even less compelling. Website usability, press releases...',
          hoursAgo: 4,
          imageUrl:
              'https://shotkit.com/wp-content/uploads/2021/06/cool-profile-pic-matheus-ferrero.jpeg',
          likes: 30),
    ];
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems = await getPosts();
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.value.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.value.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      pagingController.value.error = error;
    }
  }
}
