import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/layouts/home/cubit/cubit.dart';
import 'package:social/layouts/home/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(
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
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNaveBare(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                  ),
                  label: 'Chats'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.location_on,
                  ),
                  label: 'Users'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
