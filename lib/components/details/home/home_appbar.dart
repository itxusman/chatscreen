
import 'package:chatscreen/dashboard.dart';
import 'package:chatscreen/models/category.dart';
import 'package:chatscreen/models/recent.dart';
import 'package:chatscreen/models/trend.dart';
import 'package:chatscreen/screens/detail_screen.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {

  const HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => throw UnimplementedError();
}

class _HomeAppBarState extends State<HomeAppBar> {
   var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
    } else if (currentPage == DrawerSections.notes) {
      container = NotesPage();
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
    } else if (currentPage == DrawerSections.notifications) {
      container = logout();
    } else if (currentPage == DrawerSections.send_feedback) {
      container = SendFeedbackPage();
    }
    return Scaffold(appBar: 
    AppBar(
      backgroundColor: Color.fromARGB(251, 80, 14, 45),
      elevation: 0,
      toolbarHeight: 80,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: spacer),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  "assets/usman.jpg",
                  width: 50,
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello USMAN,",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "Good Morning",
                    style: TextStyle(color: Colors.white,),
                  )
                ],
              ),
              Spacer(),
              Image.asset(
                "assets/menu.png",
                width: 18,
                height: 14,
                color: Color.fromARGB(251, 80, 14, 45)
              ),
            ],
          ),
        ),
      ),
    ),
    body:container,
    drawer: Drawer(child: SingleChildScrollView(
      
          child: Container(
            child: Column(
              
              children: [
              
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),);
    
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
  Widget MyDrawerList() {
    return Container(
      padding: EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
         
         
          menuItem(4, "Notes", Icons.notes,
              currentPage == DrawerSections.notes ? true : false),
          Divider(),
        /*  menuItem(5, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),*/

          menuItem(6, "logout", Icons.logout_outlined,
              currentPage == DrawerSections.logout ? true : false),
          Divider(),
    
          menuItem(8, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.send_feedback ? true : false),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Color.fromARGB(255, 224, 224, 224) : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.events;
            } else if (id == 4) {
              currentPage = DrawerSections.notes;
            } else if (id == 5) {
              currentPage = DrawerSections.settings;
            } else if (id == 6) {
              currentPage = DrawerSections.notifications;
            } else if (id == 7) {
              currentPage = DrawerSections.privacy_policy;
            } else if (id == 8) {
              currentPage = DrawerSections.send_feedback;
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
enum DrawerSections {
  dashboard,
  contacts,
  events,
  notes,
  settings,
  notifications,
  privacy_policy,
  send_feedback, logout,
}



// search filed

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xFFe6e6e6),
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(8.0),
                    hintText: "Search your favorite book..",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none)),
              ),
              SizedBox(height: 20.0,


              )

         ] )
          );
  }
}
//header home
class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 406 - 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40)),
        color:  Color.fromARGB(255, 33, 105, 33),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchField(),
          SectionTitle(title: "Discover Latest Books", backgroundColor: Color.fromARGB(255, 100, 206, 103),),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: recents.map((recent) {
                int index = recents.indexOf(recent);
                return CardRecent(recent, index: index);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
//card recent
class CardRecent extends StatelessWidget {
  const CardRecent(
    this.recent, {
    Key? key,
    required this.index,
  }) : super(key: key);

  final Recent recent;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 228,
      height: 150,
      margin: EdgeInsets.only(
        right: 20,
        bottom: 10,
        top: 10,
        left: index == 0 ? 30 : 0,
      ),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            spreadRadius: 2,
            color: greyColor200,
          ),
        ],
      ),
      child: Row(
        children: [
          Image.asset(recent.image),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                recent.title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: blackColor,
                ),
              ),
              CircularPercentIndicator(
                radius: 50,
                lineWidth: 6,
                percent: recent.percent.toDouble() / 100,
                progressColor: greenColor,
                reverse: true,
              ),
              Text(
                "${recent.percent}% Completed",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: greyColor500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// section title
class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.title, required backgroundColor,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: spacer, bottom: 12),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }
}
//trending list.dart
class TrendingList extends StatelessWidget {
  const TrendingList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: trends.map((trend) {
          int index = trends.indexOf(trend);
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => DetailScreen(trend: trend)),
              );
            },
            child: Container(
              width: 110,
              height: 207,
              margin: EdgeInsets.only(
                right: 20,
                left: (index == 0) ? spacer : 0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(trend.image),
                  ),
                  Text(
                    trend.creator,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color.fromARGB(255, 46, 44, 63),
                    ),
                  ),
                  Text(
                    trend.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
//section detail.dart
class SectionDetail extends StatelessWidget {
  const SectionDetail({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 10,
            color: greyColor500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: blackColor,
          ),
        ),
      ],
    );
  }
}


class LineSection extends StatelessWidget {
  const LineSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: spacer,
      width: 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: darkColor,
      ),
    );
  }
}
// header detail
class HeaderDetail extends StatelessWidget {
  const HeaderDetail({
    Key? key,
    required this.trend,
  }) : super(key: key);

  final Trend trend;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              trend.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: blackColor,
              ),
            ),
            Text(
              trend.creator,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: greyColor400,
              ),
            ),
          ],
        ),
        Spacer(),
        Text(
          "Free Access",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: greenColor,
          ),
        ),
      ],
    );
  }
}
//detail appbar.dart
class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: greyColor100,
      elevation: 0,
      toolbarHeight: 80,
      title: Text(
        "Book Details",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: darkColor,
        ),
      ),
      leading: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: EdgeInsets.only(left: spacer),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: darkColor,
            size: 20,
          ),
        ),
      ),
      actions: [
        InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.only(right: spacer),
            child: Icon(
              Icons.share_outlined,
              color: darkColor,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(80);
}
//catagory list .dart
class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          int index = categories.indexOf(category);
          return InkWell(
            onTap: () {
              setState(() {
                selectedCategory = index;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
              alignment: Alignment.center,
              height: 41,
              margin: EdgeInsets.only(
                right: 10,
                left: index == 0 ? spacer : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: (selectedCategory == index)
                    ? greenColor
                    : Colors.transparent,
              ),
              child: Text(
                category.title,
                style: TextStyle(
                  fontSize: (selectedCategory == index) ? 14 : 12,
                  fontWeight: FontWeight.w600,
                  color:
                      (selectedCategory == index) ? whiteColor : greyColor400,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
//color constant.dart
Color darkColor = Color(0xff2D2D2D);
Color whiteColor = Color(0xffFFFFFF);
Color greenColor = Color(0xff098B5C);
Color blackColor = Color(0xff000000);
Color greyColor100 = Color(0xffF8F8F8);
Color greyColor200 = Color(0xffF3F3F3);
Color greyColor300 = Color(0xffEDEDED);
Color greyColor400 = Color(0xffBDBDBD);
Color greyColor500 = Color(0xffAFAFAF);
double spacer = 30.0;