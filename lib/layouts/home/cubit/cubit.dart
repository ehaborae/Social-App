import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/states.dart';
import 'package:social/models/social/user_model.dart';
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
}
