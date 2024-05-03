// To parse this JSON data, do
//
//     final getBranchesCategory = getBranchesCategoryFromJson(jsonString);

import 'dart:convert';

GetBranchesCategory getBranchesCategoryFromJson(String str) => GetBranchesCategory.fromJson(json.decode(str));

String getBranchesCategoryToJson(GetBranchesCategory data) => json.encode(data.toJson());

class GetBranchesCategory {
    bool status;
    String msg;
    List<Datum> data;

    GetBranchesCategory({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory GetBranchesCategory.fromJson(Map<String, dynamic> json) => GetBranchesCategory(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int? id;
    Title? title;
    String? image;
    
   
    int ?companyId;


    Datum({
         this.id,
         this.title,
         this.image,
      
         this.companyId,
      
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: Title.fromJson(json["title"]),
        image: json["image"],
     
        companyId: json["company_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "image": image,
        "company_id": companyId,
    };
}

enum CreatedAt {
    THE_202402180800_AM
}

final createdAtValues = EnumValues({
    "2024-02-18 08:00 AM": CreatedAt.THE_202402180800_AM
});

class Title {
    String en;
    String ar;

    Title({
        required this.en,
        required this.ar,
    });

    factory Title.fromJson(Map<String, dynamic> json) => Title(
        en: json["en"],
        ar: json["ar"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "ar": ar,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
