import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_2/home.dart';
import 'deal.dart';

List<Deal> newDealList = List.from(deals);

class pr3Widget extends StatelessWidget{
  const pr3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            child: ListView(
            scrollDirection: Axis.horizontal,
            
            children: [
              Container(
                width: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tileColor: Colors.blueGrey[100],
                    // title: Icon(Icons.abc),
                    subtitle: Center(child: Text("1"),),
                    onTap: () {},
                  ),
                ),
              ),
              Container(
                width: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tileColor: Colors.blueGrey[100],
                    // title: Icon(Icons.abc),
                    subtitle: Center(child: Text("2"),),
                    onTap: () {},
                  ),
                ),
              ),Container(
                width: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tileColor: Colors.blueGrey[100],
                    // title: Icon(Icons.abc),
                    subtitle: Center(child: Text("3"),),
                    onTap: () {},
                  ),
                ),
              ),Container(
                width: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: const BorderSide(
                      color: Colors.yellow,
                    ),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tileColor: Colors.blueGrey[100],
                    // title: Icon(Icons.abc),
                    subtitle: Center(child: Text("4"),),
                    onTap: () {},
                  ),
                ),
              ),
            ],
                  ),
          ),
          Container(
            height: 600,
            child: ListView(
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
            )
          )
        ],)
    );
  }
}

 