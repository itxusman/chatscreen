
import 'package:chatscreen/components/details/home/home_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor100,
      appBar: HomeAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE: header
            Header(),
            SizedBox(height: spacer),
            CategoryList(),
            SizedBox(height: spacer),
            SectionTitle(title: "Trending Now", backgroundColor: null,),
            TrendingList()
          ],
        ),
      ),
    );
  }
}
