import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/drawer.dart';
import 'package:flutter_application_2/pr3.dart';
import 'calendar.dart';
import 'db.dart';
import 'deal.dart';

class HomePage extends StatefulWidget{
  @override
  StateHomePage  createState() => StateHomePage();
}


class StateHomePage extends State<HomePage>{
    int selectedIndex = 0;
    String title = "Список дел";
    TextEditingController searchController = TextEditingController();
    bool tittleAppBar = false;
    List<Deal> newDealList = List.from(deals);
    TextEditingController titleDeal = TextEditingController();
    TextEditingController descriptionDeal = TextEditingController();
    TextEditingController imgUrl = TextEditingController();
  onItemSearch(String value) {
    if (selectedIndex == 0){
    setState(
      () {
        newDealList = deals
            .where((element) => element.title!.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    );
    }
}

  @override
  Widget build(BuildContext context) {
    Widget listSearchWidget(BuildContext context) {
      return ListView(
        children: newDealList.map(
          (deal) {
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
                  deal.id.toString(),
                ),
                title: Text(deal.title!),
                subtitle: Text(deal.discription!),
                trailing: const Icon(
                  Icons.arrow_right,
                  color: Colors.black,
                ),
                onTap: () {},
              ),
            );
          },
        ).toList(),
      );
    }

    final list = [
      listSearchWidget(context), // 0
      // const Calendar(), // 1
      const db(),
      const pr3Widget(), //2
    ];
    AppBar appBarSearch = AppBar(
      centerTitle: true,
      backgroundColor: Colors.amber,
      title: TextField(
        style: TextStyle(color: Colors.white),
        autofocus: true,
        decoration: const InputDecoration(
          label: Text("Название", style: TextStyle(color: Colors.white)),
        ),
        controller: searchController,
        onChanged: onItemSearch,
      ),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                searchController.clear();
                tittleAppBar = false;
                newDealList = deals;
              });
            },
            icon: const Icon(Icons.close))
      ],
    );

    AppBar appBar = AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.amber,
      actions: [
        if (selectedIndex == 0 || selectedIndex == 1)
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
        backgroundColor: Colors.white,
        appBar: selectedIndex != 1 ? (tittleAppBar && selectedIndex == 0 ? appBarSearch : appBar) : null,
        body: list.elementAt(selectedIndex),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: selectedIndex == 0 ? FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Добавить дело'),
          content: Container(
            height: 120,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Заголовок",
                    ),
                  controller: titleDeal,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Описание",
                  ),
                  controller: descriptionDeal,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () { 
                deals.add(new Deal(
                  id: deals.length + 1,
                  title: titleDeal.text,
                  discription: descriptionDeal.text,
                ));
                titleDeal.text = "";
                descriptionDeal.text = "";
                setState(() {
                  newDealList = deals;
                });
                Navigator.pop(context, 'OK');
                },
              child: const Text('OK'),
            ),
          ],
        ),
          ),
          ) : selectedIndex == 1 ? FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => showDialog(
              context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Добавить дела'),
          content: Container(
            height: 180,
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    labelText: "Заголовок",
                    ),
                  controller: titleDeal,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Описание",
                  ),
                  controller: descriptionDeal,
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: "Ссылка на картинку",
                  ),
                  controller: imgUrl,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () { 
                CollectionReference dealsDB = FirebaseFirestore.instance.collection('deal');
                 dealsDB.add(
                  {
                    'title': titleDeal.text.toString(),
                    'discription': descriptionDeal.text.toString(),
                    'img': imgUrl.text.toString(),
                  },
                );
                titleDeal.clear();
                descriptionDeal.clear();
                imgUrl.clear();
                Navigator.pop(context, 'OK');
                },
              child: const Text('OK'),
            ),
          ],
        ),
            ),
          ) : null,
      drawer: const MenuDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
              ),
              label: "Список дел"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: "Firebase"),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.alt_route_outlined,
            ),
            label: "Практика")
        ],
        onTap: (value) {
          setState(
            () {
              selectedIndex = value;
              if (selectedIndex == 0) {
                title = 'Список дел';
              } else if (selectedIndex == 1) {
                title = 'Firebase';
                
                //tittleAppBar = false;
              }
              else if(selectedIndex == 2) {
                title = "Практика";
              }
            },
          );
      }
    )
  );
  }
}