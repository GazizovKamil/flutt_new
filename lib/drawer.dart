import 'package:flutter/material.dart';
import 'package:flutter_application_2/servises/servises.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  DBConnection dbConnection = DBConnection();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.amber,
              ),
              currentAccountPicture: Container(
                alignment: Alignment.topLeft,
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://pixelbox.ru/wp-content/uploads/2022/05/russia-avatar-pixelbox.ru-14.jpg"),
                ),
              ),
              otherAccountsPictures: [
                IconButton(
                    onPressed: () {
                      dbConnection.logOut();
                      // Navigator.popAndPushNamed(context, '/');
                    },
                    icon: const Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                    ))
              ],
              accountName: Text("Kamil"),
              accountEmail: Text('kamil.ru'),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('settings'),
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () => {},
          ),
          ListTile(
            leading: const Icon(
              Icons.help,
              color: Colors.blue,
            ),
            title: const Text('Help'),
            trailing: const Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
            onTap: () {
              //Navigator.popAndPushNamed(context, '/test');
            },
          )
        ],
      ),
    );
  }
}