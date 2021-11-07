abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

//  ---------------- Get User Data
class HomeGetUserLoadingState extends HomeStates {}

class HomeGetUserSuccessState extends HomeStates {}

class HomeGetUserErrorInitialState extends HomeStates {
  final String error;

  HomeGetUserErrorInitialState(this.error);
}

//  ---------------- Email Verification

class HomeEmailVerificationLoadingState extends HomeStates {}

class HomeEmailVerificationSuccessState extends HomeStates {}

class HomeEmailVerificationErrorInitialState extends HomeStates {
  final String error;

  HomeEmailVerificationErrorInitialState(this.error);
}

//  ---------------- Change Bottom Nave Bar

class ChangeBottomNaveBarState extends HomeStates {}

//  ---------------- Open New Post Screen

class OpenNewPostScreenState extends HomeStates {}

//  ---------------- Pick Profile Image

class PickProfileImageState extends HomeStates {}

//  ---------------- Pick Cover Image

class PickCoverImageState extends HomeStates {}

//  ---------------- Upload User Data

class UploadUserDataLoadingState extends HomeStates {}

//  ---------------- Upload Profile Image

class UploadProfileImageSuccessState extends HomeStates {}

class UploadProfileImageErrorState extends HomeStates {}

//  ---------------- Upload Cover Image

class UploadCoverImageSuccessState extends HomeStates {}

class UploadCoverImageErrorState extends HomeStates {}

//  ---------------- Update User

class UpdateUserErrorState extends HomeStates {}

//  ---------------- Create Post

class PicPostImageState extends HomeStates {}

class RemovePostImageState extends HomeStates {}

class CreatePostLoadingState extends HomeStates {}

class CreatePostSuccessState extends HomeStates {}

class CreatePostErrorState extends HomeStates {}

//  ---------------- Get User Data
class HomeGetPostsLoadingState extends HomeStates {}

class HomeGetPostsSuccessState extends HomeStates {}

class HomeGetPostsErrorInitialState extends HomeStates {
  final String error;

  HomeGetPostsErrorInitialState(this.error);
}

//  ---------------- Get All Users
class HomeGetAllUsersLoadingState extends HomeStates {}

class HomeGetAllUsersSuccessState extends HomeStates {}

class HomeGetAllUsersErrorInitialState extends HomeStates {
  final String error;

  HomeGetAllUsersErrorInitialState(this.error);
}

//  ---------------- Logout
class LogoutLoadingState extends HomeStates {}

class LogoutSuccessState extends HomeStates {}

class LogoutErrorInitialState extends HomeStates {
  final String error;

  LogoutErrorInitialState(this.error);
}

//  ---------------- Login
class LoginLoadingState extends HomeStates {}

class LoginSuccessState extends HomeStates {}

class LoginErrorState extends HomeStates {
  final String error;

  LoginErrorState(this.error);
}

class LoginChangePasswordVisibilityState extends HomeStates {}

//  send chats
class SendMessageSuccessState extends HomeStates {}

class SendMessageErrorState extends HomeStates {}

//  receive chats
class GetMessageSuccessState extends HomeStates {}
