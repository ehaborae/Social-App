import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/cubit.dart';
import 'package:social/layouts/home/cubit/states.dart';
import 'package:social/models/social/post_model.dart';
import 'package:social/models/social/user_model.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state){},
      builder: (context, state){
        return Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Image(
                    image: NetworkImage(
                      'https://image.freepik.com/free-photo/woman-covering-her-eye-looking-away_23-2148255271.jpg',
                    ),
                    height: 200.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                BuildCondition(
                  condition: cubit.posts.length == 0,
                  builder: (context) => Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text('No posts to view, create some',style: Theme.of(context).textTheme.headline5!.copyWith(color: Colors.grey)),
                  ),
                  fallback: (context) => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => buildPostItem(context, cubit.posts[index], cubit.userModel!),
                    itemCount: cubit.posts.length,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildPostItem(context, PostModel postModel, UserModel userModel) => Card(
        elevation: 5.0,
        margin: EdgeInsetsDirectional.only(
          start: 8.0,
          end: 8.0,
          top: 8.0,
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${postModel.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
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
                        Text(
                          'January 21,2021 at 11.00 pm',
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(height: 1.0),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_horiz,
                      size: 16.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${postModel.text}',
                style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      height: 1.4,
                      fontSize: 16.0,
                    ),
              ),
              // Container(
              //   padding: const EdgeInsetsDirectional.only(bottom: 5.0),
              //   width: double.infinity,
              //   child: Wrap(
              //     crossAxisAlignment: WrapCrossAlignment.start,
              //     children: [
              //       Container(
              //         padding: const EdgeInsetsDirectional.only(end: 2.0),
              //         height: 20.0,
              //         child: MaterialButton(
              //           minWidth: 0.0,
              //           padding: EdgeInsetsDirectional.zero,
              //           onPressed: () {},
              //           height: 20.0,
              //           child: Text(
              //             '#mobile_app_dev',
              //             style: Theme.of(context).textTheme.caption!.copyWith(
              //                   height: 1.4,
              //                   fontSize: 15.0,
              //                   color: Colors.blue,
              //                 ),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         padding: const EdgeInsetsDirectional.only(end: 2.0),
              //         height: 20.0,
              //         child: MaterialButton(
              //           padding: EdgeInsets.zero,
              //           onPressed: () {},
              //           height: 20.0,
              //           minWidth: 0.0,
              //           child: Text(
              //             '#flutter',
              //             style: Theme.of(context).textTheme.caption!.copyWith(
              //                 height: 1.4, fontSize: 15.0, color: Colors.blue),
              //           ),
              //         ),
              //       ),
              //       Container(
              //         padding: const EdgeInsetsDirectional.only(end: 2.0),
              //         height: 20.0,
              //         child: MaterialButton(
              //           padding: EdgeInsets.zero,
              //           onPressed: () {},
              //           height: 20.0,
              //           minWidth: 0.0,
              //           child: Text(
              //             '#software',
              //             style: Theme.of(context).textTheme.caption!.copyWith(
              //                 height: 1.4, fontSize: 15.0, color: Colors.blue),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              if (postModel.postImage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Card(
                    elevation: 0.0,
                    margin: EdgeInsets.zero,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Image(
                      image: NetworkImage(
                        '${postModel.postImage}',
                      ),
                      height: 120.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.favorite_outline,
                              size: 16.0,
                              color: Colors.redAccent,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '120',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.comment_outlined,
                              size: 16.0,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 4.0,
                            ),
                            Text(
                              '120 comment',
                              style: Theme.of(context).textTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 15.0,
                            backgroundImage: NetworkImage(
                              '${userModel.image}',
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            'write a comment...',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      height: 1.6,
                                      fontSize: 14.0,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_outline,
                      size: 22.0,
                      color: Colors.redAccent,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.ios_share,
                      size: 22.0,
                      color: Colors.teal,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
}
