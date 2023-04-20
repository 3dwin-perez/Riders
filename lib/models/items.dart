
import 'package:cloud_firestore/cloud_firestore.dart';

class Items
{
  String? menuID;
  String? sellerUID;
  String? itemID;
  String? title;
  String? shortInfo;
  String? menuinfo;
  Timestamp? publishDate;
  String? thumbnailUrl;
  String? longDescription;
  String? status;
  int? price;

  Items(
  {
    this.menuID,
    this.sellerUID,
    this.itemID,
    this.title,
    this.shortInfo,
    this.publishDate,
    this.thumbnailUrl,
    this.longDescription,
    this.status,
  });

  Items.fromJson(Map<String, dynamic>json)
  {
    menuID = json['menuID'];
    sellerUID = json['sellerUID'];
    itemID = json['itemID'];
    title = json['title'];
    shortInfo = json['shortInfo'];
    publishDate = json['publishedDate'];
    thumbnailUrl = json['thumbnailUrl'];
    longDescription = json['longDescription'];
    status = json['status'];
    price = json['price'];

  }

  Map<String, dynamic> toJson()
  {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['menuID'] = menuID;
    data['sellerUID'] = sellerUID;
    data['itemID'] = itemID;
    data['title'] = title;
    data['shortInfo'] = shortInfo;
    data['price'] = price;
    data['publishedDate'] = publishDate;
    data['thumbnailUrl'] = thumbnailUrl;
    data['longDescription'] = longDescription;
    data['status'] = status;

    return data;
  }
}