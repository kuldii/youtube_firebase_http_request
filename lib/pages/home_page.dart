import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../pages/detail_player_page.dart';
import '../pages/add_player_page.dart';

import '../providers/players.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allPlayerProvider = Provider.of<Players>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("ALL PLAYERS"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, AddPlayer.routeName);
            },
          ),
        ],
      ),
      body: (allPlayerProvider.jumlahPlayer == 0)
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Data",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddPlayer.routeName);
                    },
                    child: Text(
                      "Add Player",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: allPlayerProvider.jumlahPlayer,
              itemBuilder: (context, index) {
                var id = allPlayerProvider.allPlayer[index].id;
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      DetailPlayer.routeName,
                      arguments: id,
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      allPlayerProvider.allPlayer[index].imageUrl,
                    ),
                  ),
                  title: Text(
                    allPlayerProvider.allPlayer[index].name,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMd()
                        .format(allPlayerProvider.allPlayer[index].createdAt),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      allPlayerProvider.deletePlayer(id, context);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}
