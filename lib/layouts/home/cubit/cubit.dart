import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
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
    'Post',
    'Users',
    'Settings',
  ];

  void changeBottomNaveBare(int index) {
    if (index == 2)
      emit(OpenNewPostScreenState());
    else {
      currentIndex = index;
      emit(ChangeBottomNaveBarState());
    }
  }

//  ---------------- Pick Profile && Cover Image

  var picker = ImagePicker();

//  ---------------- Pick Profile Image
  File? profileImage;

  Future<void> pickProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    profileImage = File(pickedFile!.path);
    emit(PickProfileImageState());
  }

//  ---------------- Pick Cover Image
  File? coverImage;

  Future<void> pickCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    coverImage = File(pickedFile!.path);
    emit(PickCoverImageState());
  }

//  ---------------- Firebase Storage, Upload Profile Image

  String? uploadedProfileImageUrl;

  void uploadProfileImage() {
    emit(UploadUserImagesLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        emit(UploadProfileImageSuccessState());
      }).catchError((error) {
        emit(UploadProfileImageErrorState());
      });
    }).catchError((error) {
      emit(UploadProfileImageErrorState());
    });
  }

//  ---------------- Firebase Storage, Upload Cover Image

  String? uploadedCoverImageUrl;

  void uploadCoverImage() {
    emit(UploadUserImagesLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        uploadedCoverImageUrl = value;
        emit(UploadCoverImageSuccessState());
      }).catchError((error) {
        emit(UploadCoverImageErrorState());
      });
    }).catchError((error) {
      emit(UploadCoverImageErrorState());
    });
  }

//  ---------------- Firebase Storage, Upload User Images

  void uploadUserImages() {
    emit(UploadUserImagesLoadingState());
    uploadProfileImage();
    uploadCoverImage();
  }
}
