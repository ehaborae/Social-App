import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/cubit.dart';
import 'package:social/layouts/home/cubit/states.dart';
import 'package:social/models/social/user_model.dart';
import 'package:social/modules/social_app/open_chat/open_chat_screen.dart';
import 'package:social/shared/components/components.dart';

class Chats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BuildCondition(
          // ignore: unnecessary_null_comparison
          condition: HomeCubit.get(context).users.length != 0,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  buildChatItem(context, HomeCubit.get(context).users[index]),
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey[200],
              ),
              itemCount: HomeCubit.get(context).users.length,
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget buildChatItem(BuildContext context, UserModel userModel) => InkWell(
        onTap: () {
          navigateTo(context, OpenChat(userModel: userModel,));
        },
        child: Container(
          padding: const EdgeInsets.all(5.0),
          height: 70.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25.0,
                backgroundImage: NetworkImage(
                  '${userModel.image}',
                ),
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      '${userModel.name}',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            height: 1.6,
                          ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.check_circle,
                      size: 14.0,
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
