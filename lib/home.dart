import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/pr3.dart';
import 'calendar.dart';
import 'deal.dart';
import 'drawer.dart';

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
    onItemSearch(String value) {
    setState(
      () {
        newDealList = deals
            .where((element) => element.title!.toLowerCase().contains(value.toLowerCase()))
            .toList();
      }
    );
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
                  color: Colors.yellow,
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
      const Calendar(), // 1
      const pr3Widget(),
    ];
    AppBar appBarSearch = AppBar(
      centerTitle: true,
      backgroundColor: Colors.orange,
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
              });
            },
            icon: const Icon(Icons.close))
      ],
    );

    AppBar appBar = AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.orange,
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
        backgroundColor: Colors.white,
        appBar: tittleAppBar ? appBarSearch : appBar,
        body: Center(
          child: list.elementAt(selectedIndex),
        ),
      drawer: MenuDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orange,
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
              label: "Календарь"),
              BottomNavigationBarItem(
              icon: Icon(
                Icons.calendar_today,
              ),
              label: "PR3")
        ],
        onTap: (value) {
          setState(
            () {
              selectedIndex = value;
              if (selectedIndex == 0) {
                title = 'Список дел';
              } 
              else if (selectedIndex == 1){
                title = 'PR3';
              }
              else {
                title = 'Календарь';
                //tittleAppBar = false;
              }
            },
          );
      }
    )
  );
  }
}