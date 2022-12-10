import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:chatscreen/components/details/home/home_appbar.dart';
import 'package:chatscreen/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(Myapp());


class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(splash: Lottie.asset('assets/18359-too-many-books (2).json'),
      backgroundColor: Color.fromARGB(234, 40, 36, 255),
      splashTransition: SplashTransition.decoratedBoxTransition,
       splashIconSize: 250,
      duration: 30,
      animationDuration: Duration(seconds: 10),
       nextScreen: HomePage(),
       
       
       )
      
      
      );
     
    
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  
  

  int currentIndex = 0;
  final Screens= [

    HomeScreen(),
    messenger(),
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(122, 0, 0, 0),
      
      body: 
       Screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        
        backgroundColor:Color.fromARGB(251, 80, 14, 45),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
        
        currentIndex: currentIndex,
        
        onTap: (index) => setState(() => currentIndex=index

        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Colors.pink,
          
          ),
          BottomNavigationBarItem(icon: Icon(Icons.messenger),
          label: "Chat",
          backgroundColor: Colors.green,
          ),
          
          
        ],
      
      
      ),
    );
  }
  }
  class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return HomeAppBar();
  

  }
}




class messenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Color.fromARGB(225, 247, 242, 244),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(251, 80, 14, 45),
        elevation: 8,
        leading: IconButton(
          icon: Icon(Icons.menu),
          color: Colors.white,
          onPressed: () {},
        ),
        title: Text(
          'Messenger',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
        ], systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
          final Message chat = chats[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(
                  user: chat.sender,
                ),
              ),
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(2),
                    decoration: chat.unread
                        ? BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            border: Border.all(
                              width: 2,
                              color: Theme.of(context).primaryColor,
                            ),
                            // shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          )
                        : BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                    child: CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(chat.sender.imageUrl),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  chat.sender.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                chat.sender.isOnline
                                    ? Container(
                                        margin: const EdgeInsets.only(left: 5),
                                        width: 7,
                                        height: 7,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      )
                                    : Container(
                                        child: null,
                                      ),
                              ],
                            ),
                            Text(
                              chat.time,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w300,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text(
                            chat.text,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black54,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
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
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  get prevUserId3 => null;

  _chatBubble(Message message, bool isMe, bool isSameUser) {
    if (isMe) {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(message.sender.imageUrl),
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.80,
              ),
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                message.text,
                style: TextStyle(
                  color: Colors.black54,
                ),
              ),
            ),
          ),
          !isSameUser
              ? Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundImage: AssetImage(message.sender.imageUrl),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black45,
                      ),
                    ),
                  ],
                )
              : Container(
                  child: null,
                ),
        ],
      );
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 70,
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.photo),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration.collapsed(
                hintText: 'Send a message..',
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Theme.of(context).primaryColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int prevUserId;
    return Scaffold(
      backgroundColor:  Color.fromARGB(134, 87, 17, 35),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(169, 63, 11, 11),
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            children: [
              TextSpan(
                  text: widget.user.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              TextSpan(text: '\n'),
              widget.user.isOnline ?
              TextSpan(
                text: 'Online',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                  color: Colors.green,
                ),
              )
              :
              TextSpan(
                text: 'Offline',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Color.fromARGB(255, 12, 12, 12),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              reverse: true,
              padding: EdgeInsets.all(20),
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Message message = messages[index];
                final bool isMe = message.sender.id == currentUser.id;
                
                var prevUserId2 = prevUserId3;
                final bool isSameUser = prevUserId2 == message.sender.id;
                prevUserId = message.sender.id;
                return _chatBubble(message, isMe, isSameUser);
              },
            ),
          ),
          _sendMessageArea(),
        ],
      ),
    );
  }
}





