abstract class HomeStates {}

class HomeInitialState extends HomeStates{}


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

class ChangeBottomNaveBarState extends HomeStates{}

//  ---------------- Open New Post Screen

class OpenNewPostScreenState extends HomeStates{}