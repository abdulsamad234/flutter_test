import 'package:flutter/material.dart';
import 'package:getx_starter/core/constants/colors.dart';
import 'package:getx_starter/home/model/post.dart';

class PostWidget extends StatelessWidget {
  PostWidget({Key? key, this.currentPost}) : super(key: key);

  final Post? currentPost;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color(0x22AAAAAA), offset: Offset(0, 12), blurRadius: 10)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(children: [
        Container(
          padding: const EdgeInsets.only(left: 20,right: 13, top: 8, bottom: 8),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50)),
                          image: DecorationImage(
                              image: NetworkImage(currentPost!.imageUrl!),
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentPost!.name!,
                          style: const TextStyle(
                              color: brandBlackColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '${currentPost!.hoursAgo!} hours ago',
                          style: const TextStyle(
                              color: greyColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                    child: Image.asset('assets/images/edit-icon.png', height: 15),
                    onTap: () {

                    },
                  ),
                    const SizedBox(
                      width: 4,
                    ),
                   GestureDetector(
                    child: Image.asset('assets/images/delete-icon.png', height: 15),
                    onTap: () {

                    },
                  ),
                  ],
                )
              ]),
        ),
        Container(
          color: greyColor.withOpacity(0.15),
          height: 1.5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Text(currentPost!.content!, style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),),
        ),
        Container(
          color: greyColor.withOpacity(0.15),
          height: 1.5,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(children: [
            Row(
              children: [
                GestureDetector(
                    child: Image.asset('assets/images/like-icon.png', height: 25),
                    onTap: () {

                    },
                  ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${currentPost!.likes!}',
                  style: const TextStyle(color: greyColor, fontSize: 10),
                )
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Row(
              children: [
                GestureDetector(
                    child: Image.asset('assets/images/comment-icon.png', height: 25),
                    onTap: () {

                    },
                  ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${currentPost!.comments!}',
                  style: const TextStyle(color: greyColor, fontSize: 10),
                )
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Row(
              children: [
                GestureDetector(
                    child: Image.asset('assets/images/share-icon.png', height: 25),
                    onTap: () {

                    },
                  ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  '${currentPost!.shares!}',
                  style: const TextStyle(color: greyColor, fontSize: 10),
                )
              ],
            ),
            const SizedBox(
              width: 8,
            ),
          ]),
        )
      ]),
    );
  }
}
