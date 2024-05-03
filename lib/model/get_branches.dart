// To parse this JSON data, do
//
//     final getBranches = getBranchesFromJson(jsonString);

import 'dart:convert';

GetBranches getBranchesFromJson(String str) => GetBranches.fromJson(json.decode(str));

String getBranchesToJson(GetBranches data) => json.encode(data.toJson());

class GetBranches {
    bool status;
    String msg;
    List<Datum> ?data;

    GetBranches({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory GetBranches.fromJson(Map<String, dynamic> json) => GetBranches(
        status: json["status"],
        msg: json["msg"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int ?id;
    Address? title;
    String ?phone;
    int ?isActive;
    String ?image;
    String ?lat;
    String ?long;
    String? morningTimeFrom;
    String? morningTimeTo;
    String? eveningTimeFrom;
    String? eveningTimeTo;
    // dynamic busyAt;
    // String busyHours;
    // int? popupCategoryId;
    // int popupProductId;
    // String? popupPhoto;
    // int showPopup;
    // String createdAt;
    // String updatedAt;
    // Instagram? instagram;
    // Twitter? twitter;
    Address ?address;
    // int minTotalOrder;
    String? deliveryTimeFrom;
    String? deliveryTimeTo;
    // String? code;
    // String taxNumber;
    // int companyId;
    // String? qrImage;
    // int isWaitingList;
    // int waitingListNotifyCount;
    // int? refId;
    // StatusEn statusEn;
    StatusAr? statusAr;
    // int statusNo;
    double distance;
    // int inFavourite;
    // double rate;
    Address? popupCategoryTitle;
    // List<BranchOrderMethod> branchOrderMethod;
    Company company;

    Datum({
         this.id,
         this.title,
         this.phone,
         this.isActive,
         this.image,
         this.lat,
         this.long,
         this.morningTimeFrom,
         this.morningTimeTo,
         this.eveningTimeFrom,
         this.eveningTimeTo,
        //  this.busyAt,
        // required this.busyHours,
        // required this.popupCategoryId,
        // required this.popupProductId,
        // required this.popupPhoto,
        // required this.showPopup,
        // required this.createdAt,
        // required this.updatedAt,
        // required this.instagram,
        // required this.twitter,
         this.address,
        // required this.minTotalOrder,
        required this.deliveryTimeFrom,
        required this.deliveryTimeTo,
        // required this.code,
        // required this.taxNumber,
        // required this.companyId,
        // required this.qrImage,
        // required this.isWaitingList,
        // required this.waitingListNotifyCount,
        // required this.refId,
        // required this.statusEn,
         this.statusAr,
        // required this.statusNo,
        required this.distance,
        // required this.inFavourite,
        // required this.rate,
        required this.popupCategoryTitle,
        // required this.branchOrderMethod,
        required this.company,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: Address.fromJson(json["title"]),
        phone: json["phone"],
        isActive: json["is_active"],
        image: json["image"],
        lat: json["lat"],
        long: json["long"],
        morningTimeFrom: json["morning_time_from"],
        morningTimeTo: json["morning_time_to"],
        eveningTimeFrom: json["evening_time_from"],
        eveningTimeTo: json["evening_time_to"],
        // busyAt: json["busy_at"],
        // busyHours: json["busy_hours"],
        // popupCategoryId: json["popup_category_id"],
        // popupProductId: json["popup_product_id"],
        // popupPhoto: json["popup_photo"],
        // showPopup: json["show_popup"],
        // createdAt: json["created_at"],
        // updatedAt: json["updated_at"],
        // instagram: instagramValues.map[json["instagram"]]!,
        // twitter: twitterValues.map[json["twitter"]]!,
        address: Address.fromJson(json["address"]),
        // minTotalOrder: json["min_total_order"],
        deliveryTimeFrom: json["delivery_time_from"],
        deliveryTimeTo: json["delivery_time_to"],
        // code: json["code"],
        // taxNumber: json["tax_number"],
        // companyId: json["company_id"],
        // qrImage: json["qr_image"],
        // isWaitingList: json["is_waiting_list"],
        // waitingListNotifyCount: json["waiting_list_notify_count"],
        // refId: json["ref_id"],
        // statusEn: statusEnValues.map[json["status_en"]]!,
        statusAr:json["status_ar"]!=null? statusArValues.map[json["status_ar"]]:null,
        // statusNo: json["status_no"],
        distance: json["distance"]?.toDouble(),
        // inFavourite: json["in_favourite"],
        // rate: json["rate"]?.toDouble(),
        popupCategoryTitle: json["popup_category_title"] == null ? null : Address.fromJson(json["popup_category_title"]),
        // branchOrderMethod: List<BranchOrderMethod>.from(json["branch_order_method"].map((x) => BranchOrderMethod.fromJson(x))),
        company: Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "phone": phone,
        "is_active": isActive,
        "image": image,
        "lat": lat,
        "long": long,
        "morning_time_from": morningTimeFrom,
        "morning_time_to": morningTimeTo,
        "evening_time_from": eveningTimeFrom,
        "evening_time_to": eveningTimeTo,
        // "busy_at": busyAt,
        // "busy_hours": busyHours,
        // "popup_category_id": popupCategoryId,
        // "popup_product_id": popupProductId,
        // "popup_photo": popupPhoto,
        // "show_popup": showPopup,
        // "created_at": createdAt,
        // "updated_at": updatedAt,
        // "instagram": instagramValues.reverse[instagram],
        // "twitter": twitterValues.reverse[twitter],
        // "address": address.toJson(),
        // "min_total_order": minTotalOrder,
        "delivery_time_from": deliveryTimeFrom,
        "delivery_time_to": deliveryTimeTo,
        // "code": code,
        // "tax_number": taxNumber,
        // "company_id": companyId,
        // "qr_image": qrImage,
        // "is_waiting_list": isWaitingList,
        // "waiting_list_notify_count": waitingListNotifyCount,
        // "ref_id": refId,
        // "status_en": statusEnValues.reverse[statusEn],
        "status_ar": statusArValues.reverse[statusAr],
        // "status_no": statusNo,
        "distance": distance,
        // "in_favourite": inFavourite,
        // "rate": rate,
        "popup_category_title": popupCategoryTitle?.toJson(),
        // "branch_order_method": List<dynamic>.from(branchOrderMethod.map((x) => x.toJson())),
        "company": company.toJson(),
    };
}

class Address {
    String ar;
    String en;

    Address({
        required this.ar,
        required this.en,
    });

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        ar: json["ar"],
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "ar": ar,
        "en": en,
    };
}

class BranchOrderMethod {
    int id;
    Address title;
    int isActive;
    String image;
    CreatedAt createdAt;
    Pivot pivot;

    BranchOrderMethod({
        required this.id,
        required this.title,
        required this.isActive,
        required this.image,
        required this.createdAt,
        required this.pivot,
    });

    factory BranchOrderMethod.fromJson(Map<String, dynamic> json) => BranchOrderMethod(
        id: json["id"],
        title: Address.fromJson(json["title"]),
        isActive: json["is_active"],
        image: json["image"],
        createdAt: createdAtValues.map[json["created_at"]]!,
        pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "is_active": isActive,
        "image": image,
        "created_at": createdAtValues.reverse[createdAt],
        "pivot": pivot.toJson(),
    };
}

enum CreatedAt {
    THE_202310100700_AM,
    THE_202310110700_AM,
    THE_202310120700_AM,
    THE_202310130700_AM,
    THE_202310140700_AM,
    THE_202310150700_AM
}

final createdAtValues = EnumValues({
    "2023-10-10 07:00 AM": CreatedAt.THE_202310100700_AM,
    "2023-10-11 07:00 AM": CreatedAt.THE_202310110700_AM,
    "2023-10-12 07:00 AM": CreatedAt.THE_202310120700_AM,
    "2023-10-13 07:00 AM": CreatedAt.THE_202310130700_AM,
    "2023-10-14 07:00 AM": CreatedAt.THE_202310140700_AM,
    "2023-10-15 07:00 AM": CreatedAt.THE_202310150700_AM
});

class Pivot {
    int branchId;
    int orderMethodId;

    Pivot({
        required this.branchId,
        required this.orderMethodId,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        branchId: json["branch_id"],
        orderMethodId: json["order_method_id"],
    );

    Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "order_method_id": orderMethodId,
    };
}

class Company {
    int id;
    Address title;
    String phone;
    int isActive;
    String image;
    String createdAt;
    String updatedAt;
    Address about;
    Address termsConditions;
    String email;

    Company({
        required this.id,
        required this.title,
        required this.phone,
        required this.isActive,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        required this.about,
        required this.termsConditions,
        required this.email,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["id"],
        title: Address.fromJson(json["title"]),
        phone: json["phone"],
        isActive: json["is_active"],
        image: json["image"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        about: Address.fromJson(json["about"]),
        termsConditions: Address.fromJson(json["terms_conditions"]),
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title.toJson(),
        "phone": phone,
        "is_active": isActive,
        "image": image,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "about": about.toJson(),
        "terms_conditions": termsConditions.toJson(),
        "email": email,
    };
}

enum Instagram {
    BHARAT_KSA,
    SHORMEH_KSA,
    TANNAR_KSA
}

final instagramValues = EnumValues({
    "bharat_ksa": Instagram.BHARAT_KSA,
    "shormeh.ksa": Instagram.SHORMEH_KSA,
    "Tannar.ksa": Instagram.TANNAR_KSA
});

enum StatusAr {
    EMPTY,
    THE_800_AM_500_PM
}

final statusArValues = EnumValues({
    "الفرع مفتوح": StatusAr.EMPTY,
    "الفرع مغلق الان ومفتوح من 8:00 AM الي 5:00 PM  من ": StatusAr.THE_800_AM_500_PM
});

enum StatusEn {
    BRANCH_IS_NOW_CLOSED_AND_ITS_OPEN_FROM_800_AM_TO_500_PM_FROM,
    BRANCH_IS_OPEN
}

final statusEnValues = EnumValues({
    "Branch is now closed and its open from 8:00 AM to 5:00 PM from ": StatusEn.BRANCH_IS_NOW_CLOSED_AND_ITS_OPEN_FROM_800_AM_TO_500_PM_FROM,
    "Branch is open": StatusEn.BRANCH_IS_OPEN
});

enum Twitter {
    BHARAT_KSA,
    SHORMEH_KSA,
    TANNAR_KSA
}

final twitterValues = EnumValues({
    "bharat_ksa": Twitter.BHARAT_KSA,
    "shormeh_ksa": Twitter.SHORMEH_KSA,
    "Tannar.ksa": Twitter.TANNAR_KSA
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
