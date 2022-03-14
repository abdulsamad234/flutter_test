import 'dart:convert';

Post userFromJson(String str) => Post.fromJson(json.decode(str));

String userToJson(Post data) => json.encode(data.toJson());

class Post {
  Post({
    this.name,
    this.comments,
    this.content,
    this.hoursAgo,
    this.imageUrl,
    this.likes,
    this.shares
  });

  String? name;
  String? content;
  int? hoursAgo;
  int? likes;
  int? comments;
  int? shares;
  String? imageUrl;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        name: json["name"] == null ? null : json["name"],
        content: json["content"] == null ? null : json["content"],
        hoursAgo: json["hoursAgo"] == null ? null : json["hoursAgo"],
        likes: json["likes"] == null ? null : json["likes"],
        comments: json["comments"] == null ? null : json["comments"],
        shares: json["shares"] == null ? null : json["shares"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "content": content == null ? null : content,
        "hoursAgo": hoursAgo == null ? null : hoursAgo,
        "likes": likes == null ? null : likes,
        "comments": comments == null ? null : comments,
        "shares": shares == null ? null : shares,
        "imageUrl": imageUrl == null ? null : imageUrl
      };
}