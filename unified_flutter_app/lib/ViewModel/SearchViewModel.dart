//import 'package:equatable/equatable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchViewModel {
//  GoogleResponse emptyFromJson(String str) => GoogleResponse.fromJson(json.decode(str));

  var queryParameters = {
    'q': 'india',
    'cx': '011476162607576381860:ra4vmliv9ti',
    'key': 'AIzaSyCHFqOHSue7ozspCqmAvbIlTjsflpnBkLg',
  };
//var ola = Uri.https(authority, unencodedPath)

  Future<GoogleResponse> getSearchResult(String searchString) async{
    var uri = Uri.https("www.googleapis.com","/customsearch/v1",{
      'q': searchString,
      'cx': '011476162607576381860:ra4vmliv9ti',
      'key': 'AIzaSyCHFqOHSue7ozspCqmAvbIlTjsflpnBkLg',
    });

    print(uri.toString());

    final response = await http.get(uri.toString());
    final jsonData = json.decode(response.body);
    print(jsonData);
    return GoogleResponse.fromJson(jsonData); // postFromJson(response.body);
  }
}

// ignore: must_be_immutable
class GoogleResponse {
  String kind;
  List<Item> items;

  GoogleResponse({
    this.kind,
    this.items,
  });

  factory GoogleResponse.fromJson(Map<String, dynamic> json) => GoogleResponse(
    kind: json["kind"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  List<Object> get props => [kind, items];
}

class Item {
  Kind kind;
  String title;
  String link;
//  Pagemap pagemap;

  Item({
   this.kind,
   this.title,
   this.link,
//   this.pagemap,
});

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: kindValues.map[json["kind"]],
    title: json["title"],
    link: json["link"],
//    pagemap: Pagemap.fromJson(json["pagemap"]),
  );

}

enum Kind { CUSTOMSEARCH_RESULT }

final kindValues = EnumValues({
  "customsearch#result": Kind.CUSTOMSEARCH_RESULT
});

class Pagemap {
  List<Cse> cseThumbnail;

  Pagemap({
   this.cseThumbnail,
});

  factory Pagemap.fromJson(Map<String, dynamic> json) => Pagemap(
    cseThumbnail: json["cse_thumbnail"] == null ? null : List<Cse>.from(json["cse_thumbnail"].map((x) => Cse.fromJson(x))),
  );

  List<Object> get props => [cseThumbnail];
}

class Cse {
  String src;
  String width;
  String type;
  String height;

  Cse({
    this.src,
    this.width,
    this.type,
    this.height,
  });

  factory Cse.fromJson(Map<String, dynamic> json) => Cse(
    src: json["src"],
    width: json["width"] == null ? null : json["width"],
    type: json["type"] == null ? null : json["type"],
    height: json["height"] == null ? null : json["height"],
  );

  Map<String, dynamic> toJson() => {
    "src": src,
    "width": width == null ? null : width,
    "type": type == null ? null : type,
    "height": height == null ? null : height,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}