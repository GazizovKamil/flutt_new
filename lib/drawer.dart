import 'package:flutter/material.dart'; 
import 'package:flutter/src/widgets/framework.dart'; 
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/servises/servises.dart'; 
 
class MenuDrawer extends StatelessWidget { 
  const MenuDrawer({super.key}); 
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
                color: Colors.orange, 
              ), 
              currentAccountPicture: Container( 
                alignment: Alignment.topLeft, 
                child: const CircleAvatar( 
                  backgroundImage: NetworkImage( 
                      "https://img.freepik.com/free-vector/mysterious-mafia-man-smoking-cigarette_52683-34828.jpg?w=740&t=st=1678455567~exp=1678456167~hmac=3c425b599a09bcfac19e184c0a33afe3931c77adedb224b5022cd2ec0b56ea8c"), 
                ), 
              ), 
              otherAccountsPictures: [ 
                IconButton( 
                    onPressed: () { 
                      Navigator.popAndPushNamed(context, '/'); 
                    }, 
                    icon: const Icon( 
                      Icons.exit_to_app, 
                      color: Colors.white, 
                    )) 
              ], 
              accountName: Text("Chamil"), 
              accountEmail: Text("kamilgazizov09@gmail.com"), 
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
              // DBConnection.logOut();
              Navigator.popAndPushNamed(context, '/'); 
            }, 
          ) 
        ], 
      ), 
    ); 
  } 
}