// To parse this JSON data, do
//
//     final getProducts = getProductsFromJson(jsonString);

import 'dart:convert';

GetProducts getProductsFromJson(String str) => GetProducts.fromJson(json.decode(str));

String getProductsToJson(GetProducts data) => json.encode(data.toJson());

class GetProducts {
    bool status;
    String msg;
    Data data;

    GetProducts({
        required this.status,
        required this.msg,
        required this.data,
    });

    factory GetProducts.fromJson(Map<String, dynamic> json) => GetProducts(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "msg": msg,
        "data": data.toJson(),
    };
}

class Data {
    int currentPage;
    List<Datum>? data;
    String firstPageUrl;
    int ?from;
    int lastPage;
    String lastPageUrl;
    List<Link> links;
    dynamic nextPageUrl;
    String path;
    String perPage;
    dynamic prevPageUrl;
    int ?to;
    int total;

    Data({
        required this.currentPage,
         this.data,
        required this.firstPageUrl,
         this.from,
        required this.lastPage,
        required this.lastPageUrl,
        required this.links,
        required this.nextPageUrl,
        required this.path,
        required this.perPage,
        required this.prevPageUrl,
         this.to,
        required this.total,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
    };
}

class Datum {
    int? id;
    Description ?title;
    Description ?description;
    // Sensitive sensitive;
    // String calories;
    int? price;
    // int newPrice;
    // int isActive;
    // int isSlider;
    // int isMorning;
    // int isEvening;
    // int indexnum;
    // int recommend;
    // int denyCoupon;
    int? categoryId;
   
   
    int ?companyId;
    String ?itemName;
    Image ?lastImage;
   
    // List<Image> images;

    Datum({
         this.id,
         this.itemName,
         this.title,
         this.description,
         
         this.price,
        
         
         this.categoryId,
        
         
         this.companyId,
       
         this.lastImage,
        
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: Description.fromJson(json["title"]),
        description: Description.fromJson(json["description"]),
        // sensitive: Sensitive.fromJson(json["sensitive"]),
        // calories: json["calories"],
        price: json["price"],
        // newPrice: json["new_price"],
        // isActive: json["is_active"],
        // isSlider: json["is_slider"],
        // isMorning: json["is_morning"],
        // isEvening: json["is_evening"],
        // indexnum: json["indexnum"],
        // recommend: json["recommend"],
        // denyCoupon: json["deny_coupon"],
        categoryId: json["category_id"],
        // createdAt: json["created_at"],
        // updatedAt: json["updated_at"],
        // sliderImage: json["slider_image"],
        // maxQuantity: json["max_quantity"],
        // limitClientCount: json["limit_client_count"],
        // departmentId: json["department_id"],
        // unitId: json["unit_id"],
        // customerPrice: json["customer_price"],
        // itemCode: json["item_code"],
        itemName: json["item_name"],
        // inPos: json["in_pos"],
        // inMobile: json["in_mobile"],
        companyId: json["company_id"],
        // refId: json["ref_id"],
        // attributesCount: json["attributes_count"],
        // inFavourite: json["in_favourite"],
        lastImage: Image.fromJson(json["last_image"]),
        // clientCurrentCount: json["client_current_count"],
        // titleMix: json["title_mix"],
        // images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        // pivot: Pivot.fromJson(json["pivot"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title!.toJson(),
        "description": description!.toJson(),
        // "sensitive": sensitive.toJson(),
        // "calories": calories,
        "price": price,
        // "new_price": newPrice,
        // "is_active": isActive,
        // "is_slider": isSlider,
        // "is_morning": isMorning,
        // "is_evening": isEvening,
        // "indexnum": indexnum,
        // "recommend": recommend,
        // "deny_coupon": denyCoupon,
        "category_id": categoryId,
        // "created_at": createdAt,
        // "updated_at": updatedAt,
        // "slider_image": sliderImage,
        // "max_quantity": maxQuantity,
        // "limit_client_count": limitClientCount,
        // "department_id": departmentId,
        // "unit_id": unitId,
        // "customer_price": customerPrice,
        // "item_code": itemCode,
        "item_name": itemName,
        // "in_pos": inPos,
        // "in_mobile": inMobile,
        "company_id": companyId,
        // "ref_id": refId,
        // "attributes_count": attributesCount,
        // "in_favourite": inFavourite,
        "last_image": lastImage!.toJson(),
        // "client_current_count": clientCurrentCount,
        // "title_mix": titleMix,
        // "images": List<dynamic>.from(images.map((x) => x.toJson())),
        // "pivot": pivot.toJson(),
    };
}

class Description {
    String ?ar;

    Description({
         this.ar,
    });

    factory Description.fromJson(Map<String, dynamic> json) => Description(
      
        ar: json["ar"],
    );

    Map<String, dynamic> toJson() => {
        "ar": ar,
    };
}

class Image {
    int id;
    String image;

    Image({
        required this.id,
        required this.image,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };
}

class Pivot {
    int branchId;
    int productId;
    int adminId;
    int isActive;
    dynamic busyAt;
    String? busyHours;

    Pivot({
        required this.branchId,
        required this.productId,
        required this.adminId,
        required this.isActive,
        required this.busyAt,
        required this.busyHours,
    });

    factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        branchId: json["branch_id"],
        productId: json["product_id"],
        adminId: json["admin_id"],
        isActive: json["is_active"],
        busyAt: json["busy_at"],
        busyHours: json["busy_hours"],
    );

    Map<String, dynamic> toJson() => {
        "branch_id": branchId,
        "product_id": productId,
        "admin_id": adminId,
        "is_active": isActive,
        "busy_at": busyAt,
        "busy_hours": busyHours,
    };
}

class Sensitive {
    dynamic ar;

    Sensitive({
        required this.ar,
    });

    factory Sensitive.fromJson(Map<String, dynamic> json) => Sensitive(
        ar: json["ar"],
    );

    Map<String, dynamic> toJson() => {
        "ar": ar,
    };
}

class Link {
    String? url;
    String label;
    bool active;

    Link({
        required this.url,
        required this.label,
        required this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}
