import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/cubit.dart';
import 'package:social/layouts/home/cubit/states.dart';
import 'package:social/modules/social_app/new_post/new_post_screen.dart';
import 'package:social/shared/components/components.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is OpenNewPostScreenState) {
          navigateTo(context, NewPost());
        }
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        var userModel = cubit.userModel;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                ),
                onPressed: () {},
              ),
            ],
            title: Text(
              cubit.titles[cubit.currentIndex],
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
          body: BuildCondition(
            condition: userModel != null,
            builder: (context) => cubit.screens[cubit.currentIndex],
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNaveBare(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    cubit.currentIndex == 0
                        ? Icons.home
                        : Icons.home_outlined,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    cubit.currentIndex == 1 ?
                    Icons.chat:Icons.chat_outlined,
                  ),
                  label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(
                    cubit.currentIndex == 2 ?
                    Icons.post_add : Icons.post_add_outlined,
                  ),
                  label: 'Post'),
              BottomNavigationBarItem(
                  icon: Icon(
                    cubit.currentIndex == 3 ?
                    Icons.location_on : Icons.location_on_outlined,
                  ),
                  label: 'Users'),
              BottomNavigationBarItem(
                  icon: Icon(
                    cubit.currentIndex == 4 ?
                    Icons.settings : Icons.settings_outlined,
                  ),
                  label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
