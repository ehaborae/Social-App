import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/cubit.dart';
import 'package:social/layouts/home/cubit/states.dart';
import 'package:social/layouts/home/home_screen.dart';
import 'package:social/modules/social_app/register/register_screen.dart';
import 'package:social/shared/components/components.dart';
import 'package:social/shared/components/constants.dart';
import 'package:social/shared/network/local/cache_helper.dart';



// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is LoginErrorState) {
          showToast(message: state.error, toastStates: ToastStates.ERROR);
        } else if (HomeCubit.get(context).userModel != null) {
          CacheHelper.saveData(key: 'uId', value: uId).then((value) {
            print('done --- $uId');
            navigateAndFinish(context, HomeScreen());
          }).catchError((error) {
            print(error.toString());
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'LOGIN',
                        style:
                            Theme.of(context).textTheme.headline4!.copyWith(
                                  color: Colors.black,
                                ),
                      ),
                      Text(
                        'Login now to communicate with friends',
                        style:
                            Theme.of(context).textTheme.headline6!.copyWith(
                                  color: Colors.grey,
                                ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      defaultFormField(
                          controller: emailController,
                          label: 'Email Address',
                          prefix: Icons.email,
                          type: TextInputType.emailAddress,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email address';
                            }
                          }),
                      SizedBox(
                        height: 15.0,
                      ),
                      defaultFormField(
                          isPassword: HomeCubit.get(context).isPassword,
                          suffixPressed: () {
                            HomeCubit.get(context)
                                .changePasswordVisibility();
                          },
                          suffix: HomeCubit.get(context).suffix,
                          controller: passwordController,
                          label: 'Password',
                          prefix: Icons.lock,
                          type: TextInputType.visiblePassword,
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password is to short';
                            }
                          }),
                      SizedBox(
                        height: 30.0,
                      ),
                      BuildCondition(
                        condition: state is! LoginLoadingState,
                        builder: (context) => defaultButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              HomeCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: 'login',
                          isUpperCase: true,
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                          ),
                          defaultTextButton(
                            text: 'register now',
                            onPressed: () {
                              navigateTo(context, RegisterScreen());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
