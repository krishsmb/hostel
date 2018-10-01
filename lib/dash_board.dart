import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:hostel/model/user.dart';
class DashBoard extends StatelessWidget {
  static String tag = 'dash-board-page';

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Chat Screen",
      home: UserList(),
    );
  }
}

class UserList extends StatefulWidget {
  @override
  State createState() => new UserListState();
}

final addUser = Builder(
  builder: (context) => IconButton(
        icon: new Icon(Icons.add),
        tooltip: "Add User",
        onPressed: () {
          // Scaffold.of(context).showSnackBar(new SnackBar(
          //   content: new Text("Add user"),
          // ));
          showDialog(context: context,builder: (BuildContext context) => _buildAddUserDialog(context));
        },
      ),
);

Widget _buildAddUserDialog(BuildContext context){
  return new AlertDialog(
    title: Text("Add User"),
    content: Text("This is a text message"),
  );
}

final calendar = Builder(
  builder: (context) => IconButton(
        icon: new Icon(Icons.calendar_today),
        tooltip: "Add User",
        onPressed: () {
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text("Calendar"),
          ));
        },
      ),
);

class UserListState extends State<UserList> {
   var data = [
    new User(
      "Krishnadas",
      "https://lh3.googleusercontent.com/-tAL9W1Z0vzk/AAAAAAAAAAI/AAAAAAAAAAA/AAN31DVK_TCb_zyVGQl9HJdpqQqTsEXwyw/s96-c-mo/photo.jpg",
      "01/10/2018"
    ),
    new User(
      "Jasif",
      "https://lh3.googleusercontent.com/-tAL9W1Z0vzk/AAAAAAAAAAI/AAAAAAAAAAA/AAN31DVK_TCb_zyVGQl9HJdpqQqTsEXwyw/s96-c-mo/photo.jpg",
      "01/10/2018"
    ),
    new User(
      "Sreerag",
      "https://lh3.googleusercontent.com/-tAL9W1Z0vzk/AAAAAAAAAAI/AAAAAAAAAAA/AAN31DVK_TCb_zyVGQl9HJdpqQqTsEXwyw/s96-c-mo/photo.jpg",
      "01/10/2018"
    ),
    new User(
      "Sruthija",
      "https://lh3.googleusercontent.com/-tAL9W1Z0vzk/AAAAAAAAAAI/AAAAAAAAAAA/AAN31DVK_TCb_zyVGQl9HJdpqQqTsEXwyw/s96-c-mo/photo.jpg",
      "01/10/2018"
    ),
    new User(
      "Umeesh",
      "https://lh3.googleusercontent.com/-tAL9W1Z0vzk/AAAAAAAAAAI/AAAAAAAAAAA/AAN31DVK_TCb_zyVGQl9HJdpqQqTsEXwyw/s96-c-mo/photo.jpg",
      "01/10/2018"
    ),
    new User(
      "Vinil Chandran",
      "https://lh3.googleusercontent.com/-_TcNCLxW8Ro/AAAAAAAAAAI/AAAAAAAABS0/9sPUP3f9U04/s98-p-k-rw-no/photo.jpg",
      "01/10/2018"
    ),
    new User(
      "Hrishikesh Menon",
      "https://lh3.googleusercontent.com/-pBzeXqRhMEU/AAAAAAAAAAI/AAAAAAAAAck/WsAX_eGMl8A/s90-p-k-rw-no/photo.jpg",
      "01/10/2018"
    )
  ];



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
        actions: <Widget>[addUser, calendar],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              InkWell(
                onLongPress: (){
                  showDialog(context: context,builder: (BuildContext context) => _buildAddUserDialog(context));
                },
                onTap: () {},
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: new EdgeInsets.all(5.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: ClipRRect(
                            borderRadius: new BorderRadius.circular(30.0),
                            child: Image.network(data[index].image),
                          ),
                          radius: 30.0,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: new Padding(
                        padding: new EdgeInsets.only(left: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                             data[index].name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15.0),
                            ),
                            new Text(
                              data[index].date,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10.0),
                            )
                          ],
                        ),
                      ),
                    ),
                    IconButton(icon: new Icon(Icons.remove_red_eye),color: Colors.blueGrey,tooltip: "Edit",onPressed: (){},)
                  ],
                ),
              ),
              Divider(
                height: 0.0,
              )
            ],
          );
        },
      ),
    );
  }
}
