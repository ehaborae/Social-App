import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/cubit.dart';
import 'package:social/layouts/home/cubit/states.dart';
import 'package:social/models/social/user_model.dart';

class OpenChat extends StatelessWidget {
  final UserModel userModel;
  var messageController = TextEditingController();

  OpenChat({required this.userModel});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20.0,
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
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                messageItem(),
                myMessageItem(),
                SizedBox(
                  height: 20.0,
                ),
                Spacer(),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  padding: EdgeInsetsDirectional.only(
                    start: 10.0,
                  ),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: messageController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Type your message here ...',
                          ),
                        ),
                      ),
                      Container(
                        width: 50.0,
                        height: double.infinity,
                        color: Colors.blue,
                        child: IconButton(
                          onPressed: () {
                            cubit.sendMessage(
                              message: messageController.text,
                              dateTime: DateTime.now().toString(),
                              receiverId: userModel.uId!,
                            );
                          },
                          icon: Icon(
                            Icons.send_outlined,
                            color: Colors.grey[300],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget messageItem() => Align(
        alignment: AlignmentDirectional.centerStart,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(10.0),
                bottomEnd: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              )),
          child: Text('Hello World'),
        ),
      );

  Widget myMessageItem() => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5,
          ),
          decoration: BoxDecoration(
              color: Colors.blue.withOpacity(.2),
              borderRadius: BorderRadiusDirectional.only(
                topEnd: Radius.circular(10.0),
                bottomStart: Radius.circular(10.0),
                topStart: Radius.circular(10.0),
              )),
          child: Text('Hello World'),
        ),
      );
}
// create new chat design
