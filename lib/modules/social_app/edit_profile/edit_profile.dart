import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/cubit.dart';
import 'package:social/layouts/home/cubit/states.dart';
import 'package:social/shared/components/components.dart';

// ignore: must_be_immutable
class EditProfile extends StatelessWidget {
  var nameController = TextEditingController();
  var bioController = TextEditingController();
  var phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var profileImage = cubit.profileImage;
        var coverImage = cubit.coverImage;
        var userModel = cubit.userModel;
        nameController.text = userModel!.name!;
        bioController.text = userModel.bio!;
        phoneController.text = userModel.phone!;

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            actions: [
              defaultTextButton(
                onPressed: () {
                  cubit.updateUserDate(
                    name: nameController.text,
                    phone: phoneController.text,
                    bio: bioController.text,
                  );
                },
                text: 'update',
              ),
              SizedBox(
                width: 8.0,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                if (state is UploadUserDataLoadingState)
                  LinearProgressIndicator(),
                if (state is UploadUserDataLoadingState)
                  SizedBox(
                    height: 5.0,
                  ),
                Container(
                  height: 200.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          if (coverImage == null)
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Card(
                                elevation: 0.0,
                                margin: EdgeInsets.symmetric(horizontal: 0.0),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image(
                                  image: NetworkImage(
                                    '${userModel.cover}',
                                  ),
                                  height: 160.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          if (coverImage != null)
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Card(
                                elevation: 0.0,
                                margin: EdgeInsets.symmetric(horizontal: 0.0),
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Image(
                                  image: FileImage(
                                    File(coverImage.path),
                                  ),
                                  height: 160.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.lightBlue,
                              child: IconButton(
                                onPressed: () {
                                  cubit.pickCoverImage();
                                },
                                icon: Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.bottomEnd,
                        children: [
                          if (profileImage == null)
                            CircleAvatar(
                              radius: 62.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: NetworkImage(
                                  '${userModel.image}',
                                ),
                              ),
                            ),
                          if (profileImage != null)
                            CircleAvatar(
                              radius: 62.0,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60.0,
                                backgroundImage: FileImage(
                                  File(profileImage.path),
                                ),
                              ),
                            ),
                          CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.lightBlue,
                            child: IconButton(
                              onPressed: () {
                                cubit.pickProfileImage();
                              },
                              icon: Icon(
                                Icons.camera_alt_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                defaultFormField(
                  controller: nameController,
                  label: 'Name',
                  prefix: Icons.person_outline,
                  type: TextInputType.name,
                  validate: (String? value) {
                    if (value!.isEmpty)
                      return 'Name must not be empty';
                    else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                defaultFormField(
                  controller: phoneController,
                  label: 'Phone',
                  prefix: Icons.phone_outlined,
                  type: TextInputType.phone,
                  validate: (String? value) {
                    if (value!.isEmpty)
                      return 'Phone must not be empty';
                    else
                      return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                defaultFormField(
                  controller: bioController,
                  label: 'Bio',
                  prefix: Icons.info_outline,
                  type: TextInputType.text,
                  validate: (String? value) {
                    if (value!.isEmpty)
                      return 'Bio must not be empty';
                    else
                      return null;
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
