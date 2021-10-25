import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/states.dart';
import 'package:social/models/social/user_model.dart';
import 'package:social/modules/social_app/chats/chats.dart';
import 'package:social/modules/social_app/feeds/feeds.dart';
import 'package:social/modules/social_app/new_post/new_post_screen.dart';
import 'package:social/modules/social_app/settings/settings.dart';
import 'package:social/modules/social_app/users/users.dart';
import 'package:social/shared/components/constants.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  //  ---------------- Get User Data
  UserModel? userModel;

  void getUserDate() {
    emit(HomeGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      print(value.data());
      userModel = UserModel.fromMap(value.data()!);
      print(FirebaseAuth.instance.currentUser!.emailVerified);
      emit(HomeGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetUserErrorInitialState(error));
    });
  }

  //  ---------------- Send Email Verification

  void sendVerification() {
    emit(HomeEmailVerificationLoadingState());
    FirebaseAuth.instance.currentUser!.sendEmailVerification().then((value) {
      emit(HomeEmailVerificationSuccessState());
    }).catchError((error) {
      emit(HomeEmailVerificationErrorInitialState(error.toString()));
    });
  }

//  ---------------- Send Email Verification

  int currentIndex = 0;

  List<Widget> screens = [
    Feeds(),
    Chats(),
    NewPost(),
    Users(),
    SettingsScreen(),
  ];

  List<String> titles = [
    'Home',
    'Chats',
    '',
    'Users',
    'Settings',
  ];

  void changeBottomNaveBare(int index) {
    if (currentIndex == 2)
      emit(OpenNewPostScreenState());
    else {
      currentIndex = index;
      emit(ChangeBottomNaveBarState());
    }
  }
}
