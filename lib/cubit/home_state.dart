abstract class HomeState {}

class InitialState extends HomeState {}


class GetPlace extends HomeState {}

class ShopAppChangePasswordVisibilityState extends HomeState {}


class GetLocation extends HomeState {}

class Appgetdatabasestate extends HomeState {}

class Appinsertdatabasestate extends HomeState {}

class InsertCustomerdatabasestate extends HomeState {}

class Appcreatdatabasestate extends HomeState {}

class Appchangiconstate extends HomeState {}

class RemoveCartsState extends HomeState {}

class AddNotes extends HomeState {}

class FilterSearchLoading extends HomeState {}

class FilterSearchSucses extends HomeState {}

class LogoutSucsses extends HomeState {}

class LoginLoading extends HomeState {}

class LoginSuccess extends HomeState {
  String? token;
  LoginSuccess(this.token);
}

class LoginError extends HomeState {
  String? error;
  LoginError(this.error);
}

class GetHomeDataLoading extends HomeState {}

class GetHomeDataSuccess extends HomeState {}

class GetHomeDataError extends HomeState {}
class AddImageProfile extends HomeState {}

class AddImageProfileError extends HomeState {}


class GetAllOrderLoading extends HomeState {}

class GetAllOrderSuccess extends HomeState {}

class GetAllOrderError extends HomeState {}
class GetBannerLoading extends HomeState {}

class GetBannerSuccess extends HomeState {}

class GetBannerError extends HomeState {}
class DeleteFoodLoading extends HomeState {}

class DeleteFoodSuccess extends HomeState {}

class DeleteFoodError extends HomeState {}

class AcceptOrderLoading extends HomeState {}

class AcceptOrderSuccess extends HomeState {
  String? message;
  AcceptOrderSuccess(this.message);
}

class AcceptOrderError extends HomeState {}

class GiveDeliveryLoading extends HomeState {}

class GiveDeliverySuccess extends HomeState {
  String? message;
  GiveDeliverySuccess(this.message);
}

class GiveDeliveryError extends HomeState {}
class AddShippingLoading extends HomeState {}

class AddShippingSuccess extends HomeState {}

class AddShippingError extends HomeState {}

class UpdateUserProfileLoading extends HomeState {}

class UpdateuserProfileSuccess extends HomeState {}

class UpdateUserProfileError extends HomeState {
  String? error;
  UpdateUserProfileError(this.error);
}
class UpdateProductLoading extends HomeState {}

class UpdateProductSuccess extends HomeState {}

class UpdateProductError extends HomeState {
  String? error;
  UpdateProductError(this.error);
}
class SendChatLoading extends HomeState {}

class SendChatSuccess extends HomeState {}

class SendChatError extends HomeState {
  String? error;
  SendChatError(this.error);
}
class AddProductLoading extends HomeState {}

class AddProductSuccess extends HomeState {}

class AddProductError extends HomeState {
  String? error;
  AddProductError(this.error);
}
class AddSizeLoading extends HomeState {}

class AddSizeSuccess extends HomeState {}

class AddSizeError extends HomeState {
  String? error;
  AddSizeError(this.error);
}

class GetPlacesLoading extends HomeState {}

class GetPlacesSucsses extends HomeState {}

class GetPlacesError extends HomeState {}

class GetPlacesDetailsLoading extends HomeState {}

class GetPlacesDetailsSucsses extends HomeState {}

class GetPlacesDetailsError extends HomeState {}

class CretaeUserDataLoading extends HomeState {}

class CretaeUserDataSuccess extends HomeState {}

class CretaeUserDataError extends HomeState {
  String? message;
  CretaeUserDataError(this.message);
}

class CretaeUserDataOffLineLoading extends HomeState {}

class CretaeUserDataOffLineSuccess extends HomeState {}

class CretaeUserDataOffLineError extends HomeState {
  String? message;
  CretaeUserDataOffLineError(this.message);
}

class CretaeSalesDataLoading extends HomeState {}

class CretaeSalesDataSuccess extends HomeState {}

class CretaeSalesDataError extends HomeState {}

class GetLocationLoading extends HomeState {}

class GetLocationSuccess extends HomeState {}

class GetLocationError extends HomeState {}

class AddAttendLoading extends HomeState {}

class AddAttendSuccess extends HomeState {
  String? message;
  String? workKind;
  AddAttendSuccess(this.message, this.workKind);
}

class AddAttendError extends HomeState {
  String? error;
  AddAttendError(this.error);
}

class ClockOutLoading extends HomeState {}

class ClockOutSuccess extends HomeState {
  String? message;

  ClockOutSuccess(this.message);
}

class ClockOutError extends HomeState {
  String? error;
  ClockOutError(this.error);
}
