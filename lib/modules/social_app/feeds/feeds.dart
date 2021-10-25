import 'package:flutter/material.dart';

class Feeds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Card(
              elevation: 10.0,
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
            Card(
              elevation: 10.0,
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
                            'https://image.freepik.com/free-photo/close-up-woman-inflates-pink-balloon_23-2148255216.jpg',
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
                                    'Ehab Borae',
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
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            height: 1.4,
                            fontSize: 16.0,
                          ),
                    ),
                    Container(
                      padding: const EdgeInsetsDirectional.only(bottom: 5.0),
                      width: double.infinity,
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsetsDirectional.only(end: 2.0),
                            height: 20.0,
                            child: MaterialButton(
                              minWidth: 0.0,
                              padding: EdgeInsetsDirectional.zero,
                              onPressed: () {},
                              height: 20.0,
                              child: Text(
                                '#mobile_app_dev',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      height: 1.4,
                                      fontSize: 15.0,
                                      color: Colors.blue,
                                    ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsetsDirectional.only(end: 2.0),
                            height: 20.0,
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              height: 20.0,
                              minWidth: 0.0,
                              child: Text(
                                '#flutter',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        height: 1.4,
                                        fontSize: 15.0,
                                        color: Colors.blue),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsetsDirectional.only(end: 2.0),
                            height: 20.0,
                            child: MaterialButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {},
                              height: 20.0,
                              minWidth: 0.0,
                              child: Text(
                                '#software',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                        height: 1.4,
                                        fontSize: 15.0,
                                        color: Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      elevation: 0.0,
                      margin: EdgeInsets.zero,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Image(
                        image: NetworkImage(
                          'https://image.freepik.com/free-photo/woman-covering-her-eye-looking-away_23-2148255271.jpg',
                        ),
                        height: 120.0,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.favorite_outline,
                                    size: 16.0,
                                    color: Colors.red,
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
                            onTap: (){},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.comment_outlined,
                                    size: 16.0,
                                    color: Colors.blue,
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
