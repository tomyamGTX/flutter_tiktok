import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class GooglePlayClone extends StatefulWidget {
  const GooglePlayClone({super.key});

  @override
  State<GooglePlayClone> createState() => _GooglePlayCloneState();
}

class _GooglePlayCloneState extends State<GooglePlayClone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10),
            child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/888/888857.png'),
          ),
          title: const Text(
            'Google Play',
            style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 24),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.black54,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.black54,
                  child: CircleAvatar(
                      foregroundColor: Colors.black54,
                      radius: 10,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.question_mark,
                        size: 20,
                      ))),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 17,
              ),
            )
          ],
        ),
        body: DefaultTabController(
            length: 5,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildTabBar(),
                  buildPlatform(),
                  buildTopChart(),
                  buildRecentActivity()
                ],
              ),
            )));
  }

  Column buildRecentActivity() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Based on your recent activity',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              HorizontalAppTile(
                imageUrl:
                    'https://play-lh.googleusercontent.com/KY0p1qXxEnylbHTYhr-khe_RX6kCyUeeKrzgoirIC-2yHHURRQkZqx8lS_gme4VPQQ=s256-rw',
                name: 'Xodo PDF Reader & Editor',
                rating: 4.8,
              ),
              HorizontalAppTile(
                imageUrl:
                    'https://play-lh.googleusercontent.com/tFFAvb_eZM5BlHYFiuyVwhM54o7mvfCOFX3AGbgTULfKpEancPmZnP1PRu44CZiZgyI=s256-rw',
                name: 'Webex',
                rating: 3.8,
              ),
              HorizontalAppTile(
                imageUrl:
                    'https://play-lh.googleusercontent.com/acGcVzju2epauWDWhLNEEVlM-G2MS9BNBudFoKgQPYOpIg6Z7lPTgZJDQnJ8MQlTKGnO=w240-h480-rw',
                name: 'starryai - Create Art with AI',
                rating: 4.8,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildTopChart() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: Text(
              'Top Chart',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w400,
                  fontSize: 20),
            ),
          ),
        ),
        buildCategory(),
        const TileApp(
          index: 1,
          rating: 4.1,
          imageUrl:
              'https://play-lh.googleusercontent.com/_LXEmB3QND_eFz4Cklao1aAnwXSg4p7syBDMBZkByNKjYrZ-XAxBZ4hwiSNyEhzsawQ=w600-h300-pc0xffffff-pd',
          appName: 'MAe by Maybank2u',
          category: 'Finance',
        ),
        const TileApp(
          index: 2,
          rating: 4.6,
          imageUrl:
              'https://seeklogo.com//images/T/tiktok-app-icon-logo-0F5AD7AE01-seeklogo.com.png',
          appName: 'TikTok',
          category: 'Video Players & Editors',
        ),
        const TileApp(
          index: 3,
          rating: 4.5,
          imageUrl:
              'https://play-lh.googleusercontent.com/Pfck8XXM4wRBgUbDnkXl3CZMWCdqZ7tEgKrhTp95OfawYCMSVpLYTNDKLWlC7E_jmQ=s64-rw',
          appName: 'CapCut - Video Editor',
          category: 'Video Players & Editors',
        )
      ],
    );
  }

  TabBar buildTabBar() {
    return const TabBar(
        labelStyle: TextStyle(
            fontSize: 14, color: Colors.black54, fontWeight: FontWeight.w500),
        tabs: [
          Tab(text: 'Games'),
          Tab(text: 'Apps'),
          Tab(text: 'Movies'),
          Tab(text: 'Books'),
          Tab(
            text: 'Kids',
          )
        ]);
  }

  Widget buildPlatform() {
    return SizedBox(
      height: 100,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 24),
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
                side: BorderSide(color: Colors.green.shade50, width: 0.5),
                padding: const EdgeInsets.all(5),
                backgroundColor: Colors.green.shade50,
                avatar: Icon(
                  Icons.phone_android,
                  size: 18,
                  color: Colors.green.shade900,
                ),
                label: Text(
                  'Phone',
                  style: TextStyle(
                    color: Colors.green.shade900,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Chip(
                padding: EdgeInsets.all(5),
                side: BorderSide(color: Colors.black54, width: 0.5),
                backgroundColor: Colors.white,
                avatar: Icon(
                  Icons.tablet_android,
                  size: 18,
                  color: Colors.black54,
                ),
                label: Text(
                  'Tablet',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Chip(
                padding: EdgeInsets.all(5),
                side: BorderSide(color: Colors.black54, width: 0.5),
                backgroundColor: Colors.white,
                avatar: Icon(
                  Icons.tv,
                  size: 18,
                  color: Colors.black54,
                ),
                label: Text(
                  'TV',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Chip(
                padding: EdgeInsets.all(5),
                side: BorderSide(color: Colors.black54, width: 0.5),
                backgroundColor: Colors.white,
                avatar: Icon(
                  Icons.laptop_chromebook,
                  size: 18,
                  color: Colors.black54,
                ),
                label: Text(
                  'Chromebook',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Chip(
                padding: EdgeInsets.all(5),
                side: BorderSide(color: Colors.black54, width: 0.5),
                backgroundColor: Colors.white,
                avatar: Icon(
                  Icons.watch,
                  size: 18,
                  color: Colors.black54,
                ),
                label: Text(
                  'Watch',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Chip(
                padding: EdgeInsets.all(5),
                side: BorderSide(color: Colors.black54, width: 0.5),
                backgroundColor: Colors.white,
                avatar: Icon(
                  Icons.car_crash,
                  size: 18,
                  color: Colors.black54,
                ),
                label: Text(
                  'Car',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  Widget buildCategory() {
    return SizedBox(
      height: 72,
      child: ListView(
        padding: const EdgeInsets.all(8.0),
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chip(
                side: BorderSide(color: Colors.green.shade50, width: 0.5),
                padding: const EdgeInsets.all(5),
                backgroundColor: Colors.green.shade50,
                label: Text(
                  'Top free',
                  style: TextStyle(
                    color: Colors.green.shade900,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Chip(
                padding: EdgeInsets.all(5),
                side: BorderSide(color: Colors.black54, width: 0.5),
                backgroundColor: Colors.white,
                label: Text(
                  'Top Grossing',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Chip(
                padding: EdgeInsets.all(5),
                side: BorderSide(color: Colors.black54, width: 0.5),
                backgroundColor: Colors.white,
                label: Text(
                  'Top Paid',
                  style: TextStyle(
                    color: Colors.black54,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}

class HorizontalAppTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rating;
  const HorizontalAppTile({
    required this.rating,
    required this.name,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 160,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Container(
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.fill)),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                name,
                style: const TextStyle(color: Colors.black87),
                textAlign: TextAlign.start,
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '$rating★',
                style: const TextStyle(color: Colors.black54),
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TileApp extends StatelessWidget {
  final int index;
  final double rating;
  final String imageUrl;
  final String appName;
  final String category;
  const TileApp({
    required this.category,
    required this.appName,
    required this.imageUrl,
    required this.rating,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Row(mainAxisSize: MainAxisSize.min, children: [
          Text('$index'),
          Image.network(
            imageUrl,
            height: 72,
            width: 80,
            fit: BoxFit.fitHeight,
          ),
        ]),
        isThreeLine: true,
        title: Text(appName),
        subtitle: Text('$category\n$rating★'),
      ),
    );
  }
}
