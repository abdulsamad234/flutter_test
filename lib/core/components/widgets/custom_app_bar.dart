import 'package:flutter/material.dart';
import 'package:getx_starter/core/constants/colors.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      this.name = 'Jane Doe',
      this.username = '@janedoe_29',
      this.imageUrl =
          'https://images.pexels.com/photos/1704488/pexels-photo-1704488.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'})
      : super(key: key);

  final String name;
  final String username;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 30, right: 32, bottom: 12),
              height: 80,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Latest Post',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      GestureDetector(
                        child: Image.asset('assets/images/refresh-icon.png',
                            height: 18),
                        onTap: () {},
                      ),
                    ]),
              ),
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
            )),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          // bottom: 70,
          child: Container(
            decoration: const BoxDecoration(
                color: primaryColorLight,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            padding:
                const EdgeInsets.only(top: 70, left: 25, right: 20, bottom: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 45,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30)),
                            image: DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 19),
                          ),
                          Text(username,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300))
                        ],
                      )
                    ],
                  ),
                ),
                Row(children: [
                  GestureDetector(
                    child: Image.asset('assets/images/search-icon.png',
                        height: 23),
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  GestureDetector(
                    child:
                        Image.asset('assets/images/menu-icon.png', height: 16),
                    onTap: () {},
                  ),
                ]),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 80);
}
