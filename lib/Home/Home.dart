import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muhasebeflutter/Home/AccountHistory/AccountHistory.dart';
import 'package:muhasebeflutter/Home/UserDialog/UserDialog.dart';
import 'package:muhasebeflutter/SQLite/Database.dart';

import 'ProcessPage/ProcessPage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Home> {
  final database = Databases();


  @override
  void initState() {
    database.open();
    database.getList();

    database.getList().then((value) => {
      value.forEach((element) {
        print(element.name);
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 25),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        shape: CircleBorder(),
                        primary: Colors.green,
                        onPrimary: Colors.green),
                    onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProcessPage())),
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "Merhaba!",
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "Bakiyen : 4000€",
                      style: TextStyle(fontSize: 15),
                    ),
                    Divider(
                      color: Colors.red,
                    ),
                    TextButton(
                      onPressed: () => {
                        ShowDilaog(context)
                      },
                      child: Text("Bilgilerimi Güncelle",
                          style: TextStyle(fontSize: 13 )),
                      style: TextButton.styleFrom(alignment: Alignment.center),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 50,
                  width: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        alignment: Alignment.center,
                        shape: CircleBorder(),
                        primary: Colors.red,
                        onPrimary: Colors.red),
                    onPressed: () => {database.remove()},
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(child: AccountHistory())
      ],
    );
  }
}
