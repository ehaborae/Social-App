import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/models/social/user_model.dart';
import 'package:social/modules/social_app/register/cubit/states.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String phone,
  }) {
    emit(RegisterLoadingState());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      userCreate(
        uId: value.user!.uid,
        email: email,
        phone: phone,
        name: name,
      );
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String uId,
    required String name,
    required String phone,
  }) {
    UserModel userModel = UserModel(
      email: email,
      name: name,
      phone: phone,
      image: 'https://i.pinimg.com/564x/e5/91/dc/e591dc82326cc4c86578e3eeecced792.jpg',
      cover: 'https://i.pinimg.com/564x/e5/91/dc/e591dc82326cc4c86578e3eeecced792.jpg',
      uId: uId,
      bio: 'Write your bio...',
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toMap())
        .then((value) {
      emit(CreateUserSuccessState());
    }).catchError((error) {
      emit(CreateUserErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(RegisterChangePasswordVisibilityState());
  }
}
