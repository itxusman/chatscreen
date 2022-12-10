import 'package:chatscreen/components/details/home/home_appbar.dart';
import 'package:chatscreen/notepad_classes.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var backgroundColor2 = null;
    return  Scaffold(
      
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NOTE: header
            Header(),
            SizedBox(height: spacer),
            CategoryList(),
            SizedBox(height: spacer),
            SectionTitle(title: "Trending Now", backgroundColor: backgroundColor2,),
            TrendingList()
          ],
        ),
      ),
    );
  }
}

//setting

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Settings Page"),
      ),
    );
  }
}
//feedback 
class SendFeedbackPage extends StatefulWidget {
  @override
  _SendFeedbackPageState createState() => _SendFeedbackPageState();
}

class _SendFeedbackPageState extends State<SendFeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Send Feedback Page"),
      ),
    );
  }
}



//notes
class NotesPage extends StatefulWidget {
  @override
  _NotesPageState createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const CustomBottomBar(),
      body: SafeArea(
          child: ListView(
        children: const [
          // app bar seaction
          CustomAppBar(),
          //search section
          SearchBar(),
          ListButtonContainer(),
          // now we create add list data
// we are using grid inside column thats why we are facing error
// use  shrinkWrap and physics widget to solve this error
          Listdata(),
          // now we craete add list data page
        ],
      )),
    );
  }
}
  

//logout class
class logout extends StatefulWidget {
  @override
  _logoutState createState() => _logoutState();
}

class _logoutState extends State<logout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("logout page"),
      ),
    );
  }
}

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(251, 80, 14, 45),
      width: double.infinity,
      height: 200,
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/usman.jpg'),
              ),
            ),
          ),
          Text(
            "Muhammad Usman",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "mu2242457@gmail.com",
            style: TextStyle(
              color:  Colors.white, fontSize: 14,
              
            ),
          ),
        ],
      ),
    );
  }
}