import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:muhasebeflutter/Model/User.dart';
import 'package:muhasebeflutter/SQLite/Database.dart';

class AccountHistory extends StatefulWidget {
  const AccountHistory({Key? key}) : super(key: key);

  @override
  _AccountHistoryState createState() => _AccountHistoryState();
}

class _AccountHistoryState extends State<AccountHistory> {
  final database = Databases();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: database.getList(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int position) {
                  User user = snapshot.data![position];
                  return Card(
                    child: ListTile(
                      title: Text(user.name!),
                    ),
                  );
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
