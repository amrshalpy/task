class LoginModel {
  bool? status;
  String? msg;
  Data? data;

  LoginModel({this.status, this.msg, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? tokenType;
  int? expiresIn;
  Client? client;
  String? tax;

  Data(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.client,
      this.tax});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    client =
        json['client'] != null ? new Client.fromJson(json['client']) : null;
    tax = json['tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['expires_in'] = this.expiresIn;
    if (this.client != null) {
      data['client'] = this.client!.toJson();
    }
    data['tax'] = this.tax;
    return data;
  }
}

class Client {
  int? id;
  String? name;
  String? phone;
  int? isActive;
  Null? image;
  int? balance;
  String? verifyCode;
  Null? fcmToken;
  String? createdAt;
  String? updatedAt;
  String? lang;
  int? blockCount;
  int? companyId;
  Null? refId;
  bool? allowCreateOrder;

  Client(
      {this.id,
      this.name,
      this.phone,
      this.isActive,
      this.image,
      this.balance,
      this.verifyCode,
      this.fcmToken,
      this.createdAt,
      this.updatedAt,
      this.lang,
      this.blockCount,
      this.companyId,
      this.refId,
      this.allowCreateOrder});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    isActive = json['is_active'];
    image = json['image'];
    balance = json['balance'];
    verifyCode = json['verify_code'];
    fcmToken = json['fcm_token'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lang = json['lang'];
    blockCount = json['block_count'];
    companyId = json['company_id'];
    refId = json['ref_id'];
    allowCreateOrder = json['allow_create_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['is_active'] = this.isActive;
    data['image'] = this.image;
    data['balance'] = this.balance;
    data['verify_code'] = this.verifyCode;
    data['fcm_token'] = this.fcmToken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['lang'] = this.lang;
    data['block_count'] = this.blockCount;
    data['company_id'] = this.companyId;
    data['ref_id'] = this.refId;
    data['allow_create_order'] = this.allowCreateOrder;
    return data;
  }
}
