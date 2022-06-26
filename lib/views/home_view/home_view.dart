import 'package:arcade_blog/components/logo_text.dart';
import 'package:arcade_blog/constants.dart';
import 'package:arcade_blog/models/login_response_model.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final LoginResponseModel model;

  const HomeView({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
            Row(
              children: [
                Text(model.fullName ?? "",
                    style:
                        TextStyle(color: kNightdarkPearlColor, fontSize: 10)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: .1,
                            blurRadius: .5,
                            offset: Offset(2, 2), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.black,
                      ),
                      child: CircleAvatar(
                        child:
                            Icon(Icons.person, size: 35, color: Colors.black),
                        backgroundColor: kNightPearlColor,
                      )),
                ),
              ],
            )
          ],
          backgroundColor: Colors.yellow),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const <Widget>[
            DrawerHeader(
                padding: EdgeInsets.symmetric(vertical: 40),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/png/menu_image.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: LogoText()),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
          ],
        ),
      ),
    );
  }
}
