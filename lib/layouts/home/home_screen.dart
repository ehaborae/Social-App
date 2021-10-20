import 'package:buildcondition/buildcondition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/cubit.dart';
import 'package:social/layouts/home/cubit/states.dart';
import 'package:social/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: BuildCondition(
            condition: cubit.userModel != null,
            builder: (context) {
              var userModel = cubit.userModel;

              return Column(
                children: [
                  if (!FirebaseAuth.instance.currentUser!.emailVerified)
                    Container(
                      color: Colors.amberAccent,
                      padding: EdgeInsetsDirectional.only(
                        start: 15.0,
                        end: 15.0,
                      ),
                      height: 50.0,
                      child: Row(
                        children: [
                          Icon(Icons.info_outline),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text('Send Email Verification'),
                          Spacer(),
                          defaultTextButton(
                            onPressed: () {
                              cubit.sendVerification();
                            },
                            text: 'send',
                          ),
                        ],
                      ),
                    ),
                ],
              );
            },
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
