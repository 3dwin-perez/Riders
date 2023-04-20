import 'package:cloud_firestore/cloud_firestore.dart';

class Menus
{
  String? menuID;
  String? sellerUID;
  String? menuTitle;
  String? menuinfo;
  Timestamp? publishDate;
  String? thumbnailUrl;
  String? status;

  Menus({

    this.menuID,
    this.sellerUID,
    this.menuTitle,
    this.menuinfo,
    this.publishDate,
    this.thumbnailUrl,
    this.status,
  });

  Menus.fromJson(Map<String, dynamic> json)
  {
    menuID = json['menuID'];
    sellerUID = json['sellerUID'];
    menuTitle = json['menuTitle'];
    menuinfo = json['menuInfo'];
    publishDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];
    status = json['status'];
  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["menuID"] = menuID;
    data["sellerUID"] = sellerUID;
    data["menuTitle"] = menuTitle;
    data["menuInfo"] = menuinfo;
    data["publishedDate"] = publishDate;
    data["thumbnailUrl"] = thumbnailUrl;
    data["status"] = status;

    return data;

  }
}