import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: Text(
          "Home Page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.green, Colors.lightBlue],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/avatar.jpeg"),
                    radius: 30,
                  ),
                  Text(
                    "Badreddine Chourane",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "chouranebd@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.green),
              title: Text("covid tracker"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(height: 15, color: Colors.purpleAccent),
            ListTile(
              leading: Icon(
                Icons.account_circle,
                color: const Color.fromARGB(255, 33, 55, 67),
              ),
              title: Text("profile"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(height: 15, color: Colors.purpleAccent),

            ListTile(
              leading: Icon(
                Icons.chat,
                color: const Color.fromARGB(255, 175, 152, 76),
              ),
              title: Text("chat"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(height: 15, color: Colors.purpleAccent),

            ListTile(
              leading: Icon(
                Icons.settings,
                color: const Color.fromARGB(255, 76, 127, 175),
              ),
              title: Text("settings"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(height: 15, color: Colors.purpleAccent),

            ListTile(
              leading: Icon(Icons.logout, color: Colors.green),
              title: Text("logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(height: 15, color: Colors.purpleAccent),
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Welcome to the home page",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
