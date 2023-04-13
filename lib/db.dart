 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/redDeal.dart';

import 'deal.dart';

class db extends StatefulWidget {
  const db({super.key});

  @override
  State<db> createState() => _dbPageState();
}

class _dbPageState extends State<db> {
String? title;
bool tittleAppBar=false;
TextEditingController searchController = TextEditingController();
onItemSearch(String value){
  setState(() {
    
  });
}



@override
Widget build(BuildContext context){
AppBar appBarSearch = AppBar(
      centerTitle: true,
      backgroundColor: Colors.amber,
      title: TextField(
        style: TextStyle(color: Colors.white),
        autofocus: true,
        controller: searchController,
        onChanged: onItemSearch,
        decoration: const InputDecoration(
          label: Text("Название", style: TextStyle(color: Colors.white)),
        ),
        
      ),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                print(searchController.text);
                searchController.clear();
                tittleAppBar = false;
              });
            },
            icon: const Icon(Icons.close))
      ],
    );

    AppBar appBar = AppBar(
      title: Text("Firebase"),
      centerTitle: true,
      backgroundColor: Colors.amber,
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                tittleAppBar = true;
              });
            },
            icon: const Icon(Icons.search))
      ],
    );

  return Scaffold(
    appBar: tittleAppBar ? appBarSearch : appBar,
    body: StreamBuilder(
      stream: FirebaseFirestore.instance.collection("deal").snapshots(),
      builder: (context, AsyncSnapshot<dynamic> snapShots){
        if (!snapShots.hasData){
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          );
        }else{
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: snapShots.data.docs.length,
            itemBuilder: (context, index) {
              String str = snapShots.data?.docs[index].get('title');
              if (tittleAppBar){
                if(str.toLowerCase().contains(searchController.text.toLowerCase())){
                  return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.blueGrey[100],
                leading: Text(
                  (index+1).toString()
                ),
                title: Text(snapShots.data?.docs[index].get('title')),
                subtitle: Text(snapShots.data?.docs[index].get('discription')),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) => redactDeadPage(
                      title: snapShots.data?.docs[index].get('title'),
                      discription: snapShots.data?.docs[index].get('discription'),
                      img: snapShots.data?.docs[index].get('img'),
                      documentFirebase: snapShots.data?.docs[index],
                    )
                    )
                  );
                },
              ),
            );
                }
                
              }else{
                return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.blueGrey[100],
                leading: Text(
                  (index+1).toString()
                ),
                title: Text(snapShots.data?.docs[index].get('title')),
                subtitle: Text(snapShots.data?.docs[index].get('discription')),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) => redactDeadPage(
                      title: snapShots.data?.docs[index].get('title'),
                      discription: snapShots.data?.docs[index].get('discription'),
                      img: snapShots.data?.docs[index].get('img'),
                      documentFirebase: snapShots.data?.docs[index],
                    )
                    )
                  );
                },
              ),
            );
              }
            },
          );
        }
      },
    ),
  );
}
}

Widget buildList(context,docs,index){
      return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(
                  color: Colors.black,
                ),
              ),
              child: ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                tileColor: Colors.blueGrey[100],
                leading: Text(
                  (index+1).toString()
                ),
                title: Text(docs['title']),
                subtitle: Text(docs['discription']),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(
                    builder: (context) => redactDeadPage(
                      title: docs['title'],
                      discription: docs['discription'],
                      img: docs['img'],
                      documentFirebase: docs,
                    )
                    )
                  );
                },
              ),
            );
    }
